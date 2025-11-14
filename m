Return-Path: <linux-watchdog+bounces-4577-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195CC5AF99
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 03:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9FBA64E1D87
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 02:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713EB267386;
	Fri, 14 Nov 2025 02:07:20 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3463E21C9E1;
	Fri, 14 Nov 2025 02:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763086040; cv=none; b=p/dBB2UPvRIbq4uK+LKo65XL2thsXniqpkDgBOWjTRtyVVLMW9cLpO7F/p9SmUxwSA6OhVd4XjtXdW83i9At68GKrR773bqkEgJycYusyyce8xp9gEGkc0i3p1AcH8WAcbOHoH+ieLaNsxQu7eNnQMhxMAMhzXi3FeyZ3DKxsNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763086040; c=relaxed/simple;
	bh=l1eR9fq2GoQk0aYMANDeU6CgWZdcrwOdrluqUXw7sOg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X4D60V0ZwzhRBtquYpUsi2YITu0fGgYaQsQg/BE9lNlSB+C9PSXWhIgTPradfTyW37Oc7ZbbrMIoIWIk2Qgvp6DGSyPk1/V+3jieelUMQWjpOAJDdUeHsfOJTj8l/Dh5sUMHuAkJVyqpc1Zy/ISPpf9DQndmqSZtokwGi+2kK4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from Jtjnmail201617.home.langchao.com
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202511141005543574;
        Fri, 14 Nov 2025 10:05:54 +0800
Received: from jtjnmailAR01.home.langchao.com (10.100.2.42) by
 Jtjnmail201617.home.langchao.com (10.100.2.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Nov 2025 10:05:54 +0800
Received: from inspur.com (10.100.2.112) by jtjnmailAR01.home.langchao.com
 (10.100.2.42) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Nov 2025 10:05:54 +0800
Received: from localhost.localdomain.com (unknown [10.94.7.17])
	by app8 (Coremail) with SMTP id cAJkCsDwK9GBjhZpqlcNAA--.25080S4;
	Fri, 14 Nov 2025 10:05:54 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <mazziesaccount@gmail.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v2] watchdog: bd96081: Fix a spelling mistake
Date: Fri, 14 Nov 2025 10:05:02 +0800
Message-ID: <20251114020502.2009-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cAJkCsDwK9GBjhZpqlcNAA--.25080S4
X-Coremail-Antispam: 1UD129KBjvdXoWruFW3uryUZrW7Ar4UXw43Wrg_yoW3Wrg_WF
	yxXrW7urn5ur1S93WDta47J3yj9rZxZFn7uFWIv3y3K3y8AryakrWDCry8Way7ur1UAw1j
	yFnIqr4F9rW3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE
	3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUr2-eDUUUU
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?On3vRJRRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+KanM1101VkdsdzkWdAahfiqmYlkH/bzoF/J+hA0EGp2658klcjiqCCy+nMgpR1c6RXSe
	YXoYUmq/AuB8mqJxuAc=
Content-Type: text/plain
tUid: 202511141005547cf4678230accad2dc3815a7e34e7dc0
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The spelling of the word "initializate" is incorrect; the correct spelling is
"initialize".

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/watchdog/bd96801_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/bd96801_wdt.c b/drivers/watchdog/bd96801_wdt.c
index 12b74fd2bc05..43ec23c53e62 100644
--- a/drivers/watchdog/bd96801_wdt.c
+++ b/drivers/watchdog/bd96801_wdt.c
@@ -370,7 +370,7 @@ static int bd96801_wdt_probe(struct platform_device *pdev)
 
 		set_bit(WDOG_HW_RUNNING, &w->wdt.status);
 	} else {
-		/* If WDG is not running so we will initializate it */
+		/* If WDG is not running so we will initialize it */
 		ret = init_wdg_hw(w);
 		if (ret)
 			return ret;
-- 
2.43.7


