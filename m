Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3DA455FAFF
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 10:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbiF2Iss (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 04:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbiF2Isr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 04:48:47 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017843CA64;
        Wed, 29 Jun 2022 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nysqDoSIXnF5KIZKd2MprpDgDytNBqd05oO/1KPwa/A=; b=HKHZiMHDaaiICoTViS7cSvKxeL
        pULqDCx+WfoeEznxIym2jHCh+xJymnby3nY4aGmT/7PCswi3irCJ6hs3owLfWJcj3TzDw30/D62Wu
        16lnkaKWLHZIsWwfpbgXzFLQf97JPapF8kEgMVSTU76hPbxbG+myGjQqKAniiFS2RAGPTYoYib1w4
        krfgoxhOSPGJu3pb6DNBACcrMFbPO7sVnvIIeUHwb7MQJPPNJVMs9VqS9r3oHDijt2pi65CEfN231
        jyK5d4YTcYVgavOPMhr9UkIu7ogYMCza4NUc0V0VmEtfeVh2FktbJ0UG6zn4K5ihkW7fORbFgL9bj
        pr0W48tQ==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o6TNG-006RUL-Un; Wed, 29 Jun 2022 10:48:38 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v2 1/3] watchdog: pm8916_wdt: Avoid read of write-only PET register
Date:   Wed, 29 Jun 2022 10:48:14 +0200
Message-Id: <20220629084816.125515-2-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com>
References: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PMIC_WD_RESET_PET is a write-only register that is used to ping
the watchdog. It does not make sense to use read-modify-write
for it: a register read will never return anything but zero.
(And actually even if it did we would still want to write again
to ensure the watchdog is pinged.)

Reduce the overhead for the watchdog ping slightly by using
regmap_write() directly instead.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v2: Add Guenter's Reviewed-by
---
 drivers/watchdog/pm8916_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 0937b8d33104..670cd79f4cf9 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -58,9 +58,8 @@ static int pm8916_wdt_ping(struct watchdog_device *wdev)
 {
 	struct pm8916_wdt *wdt = watchdog_get_drvdata(wdev);
 
-	return regmap_update_bits(wdt->regmap,
-				  wdt->baseaddr + PON_PMIC_WD_RESET_PET,
-				  WATCHDOG_PET_BIT, WATCHDOG_PET_BIT);
+	return regmap_write(wdt->regmap, wdt->baseaddr + PON_PMIC_WD_RESET_PET,
+			    WATCHDOG_PET_BIT);
 }
 
 static int pm8916_wdt_configure_timers(struct watchdog_device *wdev)
-- 
2.30.2

