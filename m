Return-Path: <linux-watchdog+bounces-4576-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51144C5AF69
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 02:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40BB94E234B
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 01:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DE523875D;
	Fri, 14 Nov 2025 01:56:21 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEB03A1D2;
	Fri, 14 Nov 2025 01:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763085381; cv=none; b=GHijhAfWQ5jpcWtTwgDjdb1U6SU5+8+tohEHKeOgUyN4SJLk8xuFKcxVLkOqj2G48prLcmH4hGS0uvga1MXJG74vi4LMofaj19p8rRCO6ErQdImL/VzlYybV4DgDLpRErELpuiaaW+QW6xOR6+yLmhRBBFjIi0JybU3eb3XtK7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763085381; c=relaxed/simple;
	bh=WkMcqHSHRIWpocJu5YTkD5v0AiAdAysTMqGuA/LmXW4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UTme6m18TcoVo0WsP7UEsX21rvnxVdXX/c53HrrQauUTTZATdkXYrjs0yzgMzK7HVTM2ZpUVDRnEvWcoM+N1YjyhDkeRfAfWkO0+N9PBA4xWRvWypMm6qeJm9YP6pW0wh6asyjCDmuSxpK0d6iblJOIrGrQNbmT6STB0f0AcH1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from Jtjnmail201616.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202511140954592736;
        Fri, 14 Nov 2025 09:54:59 +0800
Received: from jtjnmailAR02.home.langchao.com (10.100.2.43) by
 Jtjnmail201616.home.langchao.com (10.100.2.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Nov 2025 09:55:00 +0800
Received: from inspur.com (10.100.2.112) by jtjnmailAR02.home.langchao.com
 (10.100.2.43) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Nov 2025 09:55:00 +0800
Received: from localhost.localdomain.com (unknown [10.94.7.17])
	by app8 (Coremail) with SMTP id cAJkCsDweM_zixZpolYNAA--.21005S4;
	Fri, 14 Nov 2025 09:54:59 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Chu Guangqing <chuguangqing@inspur.com>
Subject: [PATCH 1/1] watchdog: at91sam9: Fix a spelling mistake
Date: Fri, 14 Nov 2025 09:53:58 +0800
Message-ID: <20251114015358.1614-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cAJkCsDweM_zixZpolYNAA--.21005S4
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWUGFyxAr4rKw4xKw43GFg_yoW3AFgEkr
	WxGa9xWr1rGFW5tr18Zw17XrWFv3WF93Z3uay3Jry3G3y5JrZrurZ2yFyxZw15Xay3Gr15
	AF1DXFsY9F9rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE
	3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_
	GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?nKiBT5RRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+KYseAVAYCq0o/n+EQ6lxsTF7AlshF3e2mr2ZRJ6OErjk9hLNC1ZPBp6JPn+jNJ0856dF
	k60rjf2lxx7QdEnl3fw=
Content-Type: text/plain
tUid: 20251114095500bc3efe0f34628d824a63042a2f99fe87
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The spelling of the word "regster" is incorrect; it should be "register".

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/watchdog/at91sam9_wdt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
index 298d545df1a1..cc5d36213aea 100644
--- a/drivers/watchdog/at91sam9_wdt.h
+++ b/drivers/watchdog/at91sam9_wdt.h
@@ -6,7 +6,7 @@
  * Copyright (C) 2007 Atmel Corporation.
  * Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries
  *
- * Watchdog Timer (WDT) - System peripherals regsters.
+ * Watchdog Timer (WDT) - System peripherals registers.
  * Based on AT91SAM9261 datasheet revision D.
  * Based on SAM9X60 datasheet.
  *
-- 
2.43.7


