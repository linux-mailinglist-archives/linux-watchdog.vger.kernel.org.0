Return-Path: <linux-watchdog+bounces-4578-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D82C5AFE0
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 03:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6ECAA34BF5C
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 02:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3069A2153D3;
	Fri, 14 Nov 2025 02:19:42 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B01DE2C9;
	Fri, 14 Nov 2025 02:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763086782; cv=none; b=KFagMEfp9jvDHcyF0Qa3SPJKYq4grqEicDJPJdthb3icuVSqH9Ucb/HkiyQ640cObLV+tfoU1hJv5/FsLwGDcziHy3/7RA2GhMlNHeKGDGVqFqboF5nundi+NGG5K2ntlCQQAy6MTEojSPG+G2iIuuUb3D7Qi60RT2QerEy2/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763086782; c=relaxed/simple;
	bh=48CjyM2AwMjsc23DNfyWp695/pjVJrBcjVimjbzXYbg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Nijmm0/BdjjRdK+tHYTWyFapnknAA1o2xfE59fYeNYvkzclcnwlWEI1/SpwxoRUK8sbDWpu0pmhuKl+47Fw8QNaLO8Yae2uKdxU+j8hcqkOkWo0FRbVY3HOfWQjbm8NDa7pAHNyWcTm5W4onncSVM/JpnudSqYM/qGee6plwBm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from Jtjnmail201614.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202511141019291711;
        Fri, 14 Nov 2025 10:19:29 +0800
Received: from jtjnmailAR02.home.langchao.com (10.100.2.43) by
 Jtjnmail201614.home.langchao.com (10.100.2.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Nov 2025 10:19:29 +0800
Received: from inspur.com (10.100.2.112) by jtjnmailAR02.home.langchao.com
 (10.100.2.43) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Nov 2025 10:19:29 +0800
Received: from localhost.localdomain.com (unknown [10.94.7.17])
	by app8 (Coremail) with SMTP id cAJkCsDwK9GxkRZpvFgNAA--.25084S4;
	Fri, 14 Nov 2025 10:19:29 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <hca@linux.ibm.com>, <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
	<borntraeger@linux.ibm.com>, <svens@linux.ibm.com>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>
CC: <linux-s390@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Chu Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v2] watchdog: diag288: Fix a spelling mistake
Date: Fri, 14 Nov 2025 10:18:34 +0800
Message-ID: <20251114021834.2346-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cAJkCsDwK9GxkRZpvFgNAA--.25084S4
X-Coremail-Antispam: 1UD129KBjvdXoW7JFy5CrWrJF4DZr18Xw1UJrb_yoWfWrX_Wa
	yIyr9a9348Kr42yF4kZw45Aa40gF4DuF1kWaySq3yag3y2vrWrGr4kJ348tr1xWFWjgrn8
	Aan0qr4S9F47tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE
	3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUFg4SDUUUU
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?X9aut5RRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+KYzHO7CvzIQvEYRP3RrTMMymYlkH/bzoF/J+hA0EGp26pktjtCORG06EFhyBEYXcMZUx
	EHpAtsdbSJKVvDTKW2Q=
Content-Type: text/plain
tUid: 20251114101930d08dc6991b159d8568959072dc9ea6c4
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

There are two word spelling errors here, correct two spelling errors.

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/watchdog/diag288_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
index 887d5a6c155b..48219844efef 100644
--- a/drivers/watchdog/diag288_wdt.c
+++ b/drivers/watchdog/diag288_wdt.c
@@ -6,10 +6,10 @@
  * to CP.
  *
  * The command can be altered using the module parameter "cmd". This is
- * not recommended because it's only supported on z/VM but not whith LPAR.
+ * not recommended because it's only supported on z/VM but not with LPAR.
  *
  * On LPAR, the watchdog will always trigger a system restart. the module
- * paramter cmd is meaningless here.
+ * parameter cmd is meaningless here.
  *
  *
  * Copyright IBM Corp. 2004, 2013
-- 
2.43.7


