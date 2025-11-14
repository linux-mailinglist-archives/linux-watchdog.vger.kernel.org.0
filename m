Return-Path: <linux-watchdog+bounces-4579-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45338C5B01C
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 03:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F01354E13DD
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 02:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5DE21E087;
	Fri, 14 Nov 2025 02:28:26 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97F51F5842;
	Fri, 14 Nov 2025 02:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763087306; cv=none; b=jrqgh4JD+LV8k6lSu3dvm8meBKQw1YybeJpsHqxUwJagJQBVMsJiOH75NxYQ052erj9TrrOeKIOzxs8kE2RiczxvG/Ho7l2B5ntJaH6yFs3wJO1gXQYGBymRnDuoajL5kUXZvCbu0S7z4je5r1O8WJ+TU9EqO2AHIZWnG32kzeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763087306; c=relaxed/simple;
	bh=+Q4KHRaNksiaz0YaV3/4Mihu4MgLih+spnrsoRC41Q8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rbXTOBLuFC1Wp04WhADMofvkRn4v5WlmYPOLBVzNSb+qyI5gwWL39o87Wt7JHCxzELIi8TDQ4SKPOO0zQMbkKF8Exemf9DzWTndsXmTufoD3H5jY5f8aATqgVHR4TnZVhXGiltj+twP3tjyC5o7TkiQ0V/soCtVGg+DKRPpFFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from Jtjnmail201613.home.langchao.com
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202511141028137133;
        Fri, 14 Nov 2025 10:28:13 +0800
Received: from jtjnmailAR01.home.langchao.com (10.100.2.42) by
 Jtjnmail201613.home.langchao.com (10.100.2.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Nov 2025 10:28:12 +0800
Received: from inspur.com (10.100.2.112) by jtjnmailAR01.home.langchao.com
 (10.100.2.42) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Nov 2025 10:28:12 +0800
Received: from localhost.localdomain.com (unknown [10.94.7.17])
	by app8 (Coremail) with SMTP id cAJkCsDw0NC7kxZpflkNAA--.24527S4;
	Fri, 14 Nov 2025 10:28:12 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <craig.lamparter@hpe.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v2] watchdog/hpwdt: Fix a spelling mistake
Date: Fri, 14 Nov 2025 10:27:22 +0800
Message-ID: <20251114022722.2560-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cAJkCsDw0NC7kxZpflkNAA--.24527S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry8Zry7CFW8WF18ur1rZwb_yoWfZrX_ur
	WxJrZruw1kJFy0vwn8Z345Aw4Iv3ZFqFn7Jrn7tFZ3Ca97AryY9rZ7K34Iq3yq9w15XFyY
	vwnFgr4a9F18GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
X-CM-DELIVERINFO: =?B?gp2/8JRRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+KYLoUdZA17rw8wfZkO+lRaKmYlkH/bzoF/J+hA0EGp26nVoKkpCfzOvWjsfyuJg0xWgy
	6e6x6e9DpSCxhdkzego=
Content-Type: text/plain
tUid: 20251114102813bc3ecd78bac877f47fe7c84675d24051
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The spelling of the word "auxilary" is incorrect; it should be "auxiliary".

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/watchdog/hpwdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index ae30e394d176..5909da9a7eae 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -52,7 +52,7 @@ static const struct pci_device_id hpwdt_devices[] = {
 MODULE_DEVICE_TABLE(pci, hpwdt_devices);
 
 static const struct pci_device_id hpwdt_blacklist[] = {
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_HP, 0x3306, PCI_VENDOR_ID_HP, 0x1979) }, /* auxilary iLO */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_HP, 0x3306, PCI_VENDOR_ID_HP, 0x1979) }, /* auxiliary iLO */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_HP, 0x3306, PCI_VENDOR_ID_HP_3PAR, 0x0289) },  /* CL */
 	{0},			/* terminate list */
 };
-- 
2.43.7


