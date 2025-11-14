Return-Path: <linux-watchdog+bounces-4581-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F6C5B03A
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 03:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB6664E3355
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 02:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A038421D3D2;
	Fri, 14 Nov 2025 02:37:09 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3B01865FA;
	Fri, 14 Nov 2025 02:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763087829; cv=none; b=JAK1/ZcAVcUwFQCxaXVFpJ2J1MOiW/ZhDyG6DhWJWYZC7OFOENek29UlQMNAVkZI3ZZpy6YCIWxXqBzButP6VGHrXoOuQ4LInb9ch5O6eRc9N3C6d81T1+dzoKb+u9lDWWskeopvxRgiWcNT5Aj9hPHW+IivFEj7uTxpRqcMGuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763087829; c=relaxed/simple;
	bh=nuyaRwwlSuxbqYod6tPLbs/fmhP9qgMqhbKBIuw0Wjg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZOEQ8IAiQFJCGSUx5azahYl6D2OhOOiErCe+F0K4rYQPjq0HdEXFkxGW/YIpOrio2k1921SnJBmCDodSuM0Xt1CHvwJbJpRSurV4JoG7iuzK8j74r1cg58s7f3n8kov3tVTtMROmIdjcictXWynk4H/vFCYK5WyJVUApQ8H5FH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from Jtjnmail201616.home.langchao.com
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id 202511141035494803;
        Fri, 14 Nov 2025 10:35:49 +0800
Received: from jtjnmailAR02.home.langchao.com (10.100.2.43) by
 Jtjnmail201616.home.langchao.com (10.100.2.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Nov 2025 10:35:48 +0800
Received: from inspur.com (10.100.2.112) by jtjnmailAR02.home.langchao.com
 (10.100.2.43) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Nov 2025 10:35:48 +0800
Received: from localhost.localdomain.com (unknown [10.94.7.17])
	by app8 (Coremail) with SMTP id cAJkCsDw4dCElRZp_VkNAA--.25046S4;
	Fri, 14 Nov 2025 10:35:48 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v2] watchdog/max63xx: Fix a spelling mistake
Date: Fri, 14 Nov 2025 10:34:54 +0800
Message-ID: <20251114023454.2828-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cAJkCsDw4dCElRZp_VkNAA--.25046S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtr18AF48uF1rXw4xCry8Xwb_yoW3GrX_WF
	W2qrs3Ga1rGFZ7ta4DJw1fury09r4UCF18X397trZ3J3s7ZrWDurWkXr97Xa45J3y7Cry5
	CryDXr409wnrZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
X-CM-DELIVERINFO: =?B?YTRwN5RRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+KbSUYLTO4E6GYUQB4CKRhkOmYlkH/bzoF/J+hA0EGp26xPP0Zd0Z7WGOkkaByISaIq9E
	+hreFfxgmEuAZjQpdWU=
Content-Type: text/plain
tUid: 202511141035499ea39a65487ba75894e761c2a823900a
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The spelling of the word "completly" is incorrect; it should be "completely".

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/watchdog/max63xx_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/max63xx_wdt.c b/drivers/watchdog/max63xx_wdt.c
index 21935f9620e4..cf18c3c4e74c 100644
--- a/drivers/watchdog/max63xx_wdt.c
+++ b/drivers/watchdog/max63xx_wdt.c
@@ -65,7 +65,7 @@ struct max63xx_wdt {
  * delay (selected with the "nodelay" parameter).
  *
  * I also decided to remove from the tables any timeout smaller than a
- * second, as it looked completly overkill...
+ * second, as it looked completely overkill...
  */
 
 /* Timeouts in second */
-- 
2.43.7


