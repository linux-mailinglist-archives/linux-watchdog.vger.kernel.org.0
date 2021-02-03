Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D5330D9C3
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Feb 2021 13:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbhBCM1u (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Feb 2021 07:27:50 -0500
Received: from m12-11.163.com ([220.181.12.11]:41302 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234322AbhBCM1t (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Feb 2021 07:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=PD+16
        zsWDskJ9hxZKupdeThZECX1ugATjnGJSxAD6IU=; b=gh9Fx0ZlGRQjn70rqhxN3
        wX/BSrfDb+FTlQIkT8+++O71vquT0O7kUcRelplyMBmwc2eyPjrcbKUjuV6fERbh
        VVvV5WwBX72+hKmtp0tPlz2NuIWjIB9wnsWvhO7HILuar5vjKlvkYSmyu4HhaZL2
        2lMNG5h0U4528LwZQlPEFs=
Received: from yangjunlin.ccdomain.com (unknown [119.137.55.230])
        by smtp7 (Coremail) with SMTP id C8CowABHPZVVlhpgBhL_Lw--.23015S2;
        Wed, 03 Feb 2021 20:25:59 +0800 (CST)
From:   angkery <angkery@163.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Junlin Yang <yangjunlin@yulong.com>
Subject: [PATCH] watchdog: diag288_wdt: Remove redundant assignment
Date:   Wed,  3 Feb 2021 20:24:04 +0800
Message-Id: <20210203122404.752-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowABHPZVVlhpgBhL_Lw--.23015S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1kKF4fZr4kJw15CFW5trb_yoWfuFg_C3
        WIyr97urn8Kws5Zr12g3W5urW2qF1DZFs7uanav34fA347JryrXrZ7Xryjqw17Way0vrya
        vayDJr4F9rnrAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUexhLUUUUUU==
X-Originating-IP: [119.137.55.230]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/1tbiLRcuI1SIk5egGQAAsW
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Junlin Yang <yangjunlin@yulong.com>

The assign for 'ret' is redundant and can be removed,
because it will be assigned before use.

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
 drivers/watchdog/diag288_wdt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
index aafc8d9..4cb1087 100644
--- a/drivers/watchdog/diag288_wdt.c
+++ b/drivers/watchdog/diag288_wdt.c
@@ -118,8 +118,6 @@ static int wdt_start(struct watchdog_device *dev)
 	if (test_and_set_bit(DIAG_WDOG_BUSY, &wdt_status))
 		return -EBUSY;
 
-	ret = -ENODEV;
-
 	if (MACHINE_IS_VM) {
 		ebc_cmd = kmalloc(MAX_CMDLEN, GFP_KERNEL);
 		if (!ebc_cmd) {
@@ -167,8 +165,6 @@ static int wdt_ping(struct watchdog_device *dev)
 	int ret;
 	unsigned int func;
 
-	ret = -ENODEV;
-
 	if (MACHINE_IS_VM) {
 		ebc_cmd = kmalloc(MAX_CMDLEN, GFP_KERNEL);
 		if (!ebc_cmd)
-- 
1.9.1

