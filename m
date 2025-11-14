Return-Path: <linux-watchdog+bounces-4582-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A471DC5B07F
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 03:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B23B03BA614
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 02:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9E6225A34;
	Fri, 14 Nov 2025 02:47:43 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA85E1F30C3;
	Fri, 14 Nov 2025 02:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763088462; cv=none; b=to4wuNPbUDQzhILsE1FjXl2ZXcmL3QXafz+TjwekCNsktBKml2+h0JpbyLhyEIykvxzanNYSRNOR4X/a9wm+FbYs0G5DMTmVcPy408ydrjL/CCOFfTOA9nHJRVz8kXKfuwugEsj9Grk7a2boDySXMxpRD8ONbjLMPciuA+ofSLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763088462; c=relaxed/simple;
	bh=pWmNH+8PgZAUVY+OS3aLqlrNkMHtZyOvIYTqK5AYS80=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DlUO1AqaueeYiAJKyRT+28TiqMpAuMdWpmY6lpZq+0jQgVDw3B3Qe46Hnq9pOh7r2Tt768NxtrwqQIL+h/5yPNYGw0RQjURh9mws9RDIFDEN+uOZF67jL36KKEli88+7vvsY5+uSXyIm1kmXGe5xy57PeL0cL3ej3PZw2+bIi8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from Jtjnmail201616.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202511141047333814;
        Fri, 14 Nov 2025 10:47:33 +0800
Received: from jtjnmailAR01.home.langchao.com (10.100.2.42) by
 Jtjnmail201616.home.langchao.com (10.100.2.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Nov 2025 10:47:33 +0800
Received: from inspur.com (10.100.2.112) by jtjnmailAR01.home.langchao.com
 (10.100.2.42) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Nov 2025 10:47:33 +0800
Received: from localhost.localdomain.com (unknown [10.94.7.17])
	by app8 (Coremail) with SMTP id cAJkCsDweM9EmBZp5loNAA--.21017S4;
	Fri, 14 Nov 2025 10:47:33 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v2] watchdog/octeon-wdt: Fix a spelling mistake
Date: Fri, 14 Nov 2025 10:46:45 +0800
Message-ID: <20251114024645.3045-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cAJkCsDweM9EmBZp5loNAA--.21017S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1xAr1fGryxurWUCF47twb_yoWfWrg_GF
	97XrWxWrsxGr4Iyw1kXr9IyrW09r4rX3WxCa1Iq34ag3y8Xwsak393urZ2vw1rXrW3Jr9x
	JFnYqr4Sgay7XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUr2-eDUUUU
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?9cqThJRRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+KajinFEmeukZvw7bQe23aTCmYlkH/bzoF/J+hA0EGp26uVINhC/+oHQZs9c9wbUkFdkC
	4Z3H5vPkIGnk+ZdSDeI=
Content-Type: text/plain
tUid: 20251114104733ad281940f7da03a9ae712c4f68f43f0f
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The spelling of the word "infomration" is incorrect; it should be "information".

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/watchdog/octeon-wdt-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/octeon-wdt-main.c b/drivers/watchdog/octeon-wdt-main.c
index 0615bb816082..1edbd471fecd 100644
--- a/drivers/watchdog/octeon-wdt-main.c
+++ b/drivers/watchdog/octeon-wdt-main.c
@@ -203,7 +203,7 @@ static const char reg_name[][3] = {
  * and create a stack for C code. It then calls the third level
  * handler with one argument, a pointer to the register values.
  * 3) The third, and final, level handler is the following C
- * function that prints out some useful infomration.
+ * function that prints out some useful information.
  *
  * @reg:    Pointer to register state before the NMI
  */
-- 
2.43.7


