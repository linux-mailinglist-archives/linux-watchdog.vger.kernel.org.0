Return-Path: <linux-watchdog+bounces-4418-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59698C12D3F
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 05:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19B084E7ADB
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 04:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D426C2882AF;
	Tue, 28 Oct 2025 04:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="FtpWpfHH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from outbound.ms.icloud.com (p-west3-cluster6-host6-snip4-2.eps.apple.com [57.103.75.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF10271A6D
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 04:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.75.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761624115; cv=none; b=kbhi9V7ekRSlbwHEb2Ns9Vs5+H2jmod9FoFZVWPqXnb0HM+r+3JPIV4KjqSDzAkPNZYsT2AjeIPFYMfCxQ9nwvMrGKFYrItzKoZRhAuvCYYBXjY/VGuPL5qMh2vt0zRvZiiYO9xgZGUOGgquJS0j6KI8PoXINPnUwkrLFpt5eys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761624115; c=relaxed/simple;
	bh=NmdtqEn/HsKHv1qTNYIolhmtNyLZLW2J0KOaF1TeJZQ=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=YrIzDT/nMZDSHlg1FpSilXjdyjFF3o0VBcD/3nctGckLmIFVIVzakF1oxyJfj4j6NbkGLM6MOMzcdN0MUyD/QQXFkJafCQDzq8C93DC2Wr8eB4Arm4VdkzWULSolSZxPW+0Qi8nX/ahbNND16VTc48qPvujkzYBTxrppFf5uYrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=FtpWpfHH; arc=none smtp.client-ip=57.103.75.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-1 (Postfix) with ESMTPS id 57E18180042B;
	Tue, 28 Oct 2025 04:01:52 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; bh=8ermkc3OwB7sxfPhqxOVTMMuINyEAMCqaJ7n07ZN4mY=; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version:x-icloud-hme; b=FtpWpfHH9T3rJAz80+X5uqzS7BMm2s92q/GbHcojJqR9wUG8Z9TpC3WnMCCHPNdO/30PCcBnQGXZYh6KwcemuLdMSsxSnwKqB7S/ys2YmxYxB4N0kgZmeTNRQBqD1mPD2XnqnbumhRv1jncvm4eroEq7EFRSVxsUFK3O9lzg93zn5mC6DrV/an+XhYzWxezRfCxnoxB0a9ln2icYSI4qT/sAG8MTE1usohobSWU2dFVa4Vl87kc7dpSN4gyRnVDBoucAi2g18pJ/m9foY6Xg1af+dUywnCorwpzoJPxsxl3GX0v699AoXBZbszgEKEB4NM1jlxzlY7awT2s2b6+2eg==
Received: from [192.168.4.116] (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-1 (Postfix) with ESMTPSA id AA91518000BE;
	Tue, 28 Oct 2025 04:01:51 +0000 (UTC)
Message-ID: <fe09cb336dca5f277769b115dae55b9639dc92a7.camel@icloud.com>
Subject: [PATCH 2/3] watchdog/diag288: Fix module comment typos
From: Zoe Gates <zoe.blair.gates@icloud.com>
To: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, linux-s390@vger.kernel.org,
 linux-watchdog@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Mon, 27 Oct 2025 23:01:49 -0500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 57_eBduBDHM8mNf4alYf1Xrzr6U3GuN0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAzMiBTYWx0ZWRfX5dtEQdUSylpj
 QZo3IfapPWrHrA3SFiuIeMxzJD+ZJtsA5rkI0t6z7IZgOR4job6YO9+ksLRTg2iKaSDNrIhTbo/
 aQbrGvvsMLKUVz32kf4WsO8glxhtTkV1ChhhK+F4TAKd0GUOxPaoaGCY/xJ6UX7dk8ROv1MUpFq
 OQ19jM0q2owuAaYoThseDzmnZWmsMr8jp5xpWnHws1yqkVCy5KYhnSv8u627XCbsclZtp5PCinp
 cYTEqUcZIrTGEp6iKA1q/4RZwoEnxCP+3KcOBpdHHCXBCGoEG2T/GixIaZNDRfNrcXhr3Oa3k=
X-Proofpoint-GUID: 57_eBduBDHM8mNf4alYf1Xrzr6U3GuN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2510280032
X-JNJ: AAAAAAAB7TovGJXjaCsIxm1GtFqn7cxdgFTav+RuKK927tWKT0VEDeesyalppjyEMSgVHvo/CiVASfKX5OZhmSsyddf9kRk+rmUL+ZvkJDZsZ8YL7tErvpRnzaGmyRghQY5yaEaoeERi4Bj2h7lhr+pgp8gNDMiGtw6N0+x2Weg9stJYUrl4nW3b77DqcoIxoCUXsmhSB7zKGgSrgMgKKM4ZEFteWEZ2ZvVALwKAGB8f1Kh9+BKVWHSAzmYh5WAMdSIPD9vu43So+6QxoT5w/cEPhtBccMRZ8YdKj8DbhIu2tNzBq9t1xs19cnsI5Al1Mhrqb/RfeYfPYiFU+7046dlg+vvU7n5XlKn/FVDWISmUamx3bTnk9iktWoE/9f5e3qy+lnPYA0yQhcMK0sHkc8B0MEnBqRE/Ic1RVsay29x87Q9kfF9EUrGIqZtGv+GU3ctu8TGT7FxLF66XAUqCabxeCE/86BPvzaLQ8VQC6dPZXVrLgWW5W7UiH0NX/F5SpU/w40jxwVLYW3fRdx31Jxh+jYSh8NX++DSBRNKfMNatH33GGBzNyKNV0NifN3p45gzecOCBacKHaJCu53cvcqIPeuRzWBIa6x0z7imX7Eozk9Fhlp7LfOBB7JdOHlJ+ZUH8KYeYDr7AptvvJ0Jo/S4+Uyh6MK88cH+tJClsSADe6y/uMPbD8DPspkYj0s6Mo59zrsV6sIVzKV364zQGO46GzbgY4NJ5RaiH5x7zMrJ1V+4lc3ffwQbReR8HcTpGJnpAwWUm0N8=

From ebec904b22077c3ebd0a18956397a9b0540a2714 Mon Sep 17 00:00:00 2001
From: Zoe Gates <zoe@zeocities.dev>
Date: Mon, 27 Oct 2025 22:14:50 -0500
Subject: [PATCH 2/3] watchdog/diag288: Fix module comment typos

Correct spelling and capitalizaion in the header comment so the
documentation reads cleanly.

Signed-off-by: Zoe Gates <zoe@zeocities.dev>
---
 drivers/watchdog/diag288_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/diag288_wdt.c
b/drivers/watchdog/diag288_wdt.c
index 887d5a6c155b..656b937f7653 100644
--- a/drivers/watchdog/diag288_wdt.c
+++ b/drivers/watchdog/diag288_wdt.c
@@ -6,10 +6,10 @@
  * to CP.
  *
  * The command can be altered using the module parameter "cmd". This
is
- * not recommended because it's only supported on z/VM but not whith
LPAR.
+ * not recommended because it's only supported on z/VM but not with
LPAR.
  *
- * On LPAR, the watchdog will always trigger a system restart. the
module
- * paramter cmd is meaningless here.
+ * On LPAR, the watchdog will always trigger a system restart. The
module
+ * parameter cmd is meaningless here.
  *
  *
  * Copyright IBM Corp. 2004, 2013
--=20
2.51.1

