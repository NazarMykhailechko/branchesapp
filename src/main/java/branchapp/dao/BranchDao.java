package branchapp.dao;

import branchapp.model.BankBranchCount;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BranchDao extends JpaRepository<BankBranchCount, Integer> {
}