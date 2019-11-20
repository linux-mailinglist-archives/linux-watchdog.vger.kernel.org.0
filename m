Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6124103CFB
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2019 15:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbfKTOJW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 09:09:22 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38993 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728541AbfKTOJW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 09:09:22 -0500
Received: by mail-qk1-f195.google.com with SMTP id o17so1304421qko.6
        for <linux-watchdog@vger.kernel.org>; Wed, 20 Nov 2019 06:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Tn/IZ/9iAhJ9rrLzfffGxc9IBIRNvFYY2vR+GzXgIUA=;
        b=F4lZYd3tA7O+PvpDlVtITQKnkIgKUuk2YtPvAbJrPFy8Ad6ingrvMuu1fXorUMesIo
         FT4X5Ls68ccX77oF8AcrAdmypfY3iRK7PbiOh4Bt/YgeoFElkghv4Jh0C9uVvpSIwurg
         xXqZgcAsw3PAzfdpDTeNw6Y+t+4CYyQhbJq4QoVREHGaswjVYTsJtJVrze1uIO4cFndb
         ziZvL/Um0ruaiROi50Cd0ipIsy245ppSw1asQDxDJ9dloIFoZ30EZW/JE84iATy/hCJM
         ma+Q34vtUrlfe5Bp51udbotRTYxRZIMCN95GFCmb4skiRs6xXjy4w9YDFVmRAgYyqy/f
         hU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Tn/IZ/9iAhJ9rrLzfffGxc9IBIRNvFYY2vR+GzXgIUA=;
        b=h22ttqEN2iX5gC9WSFmckJP3u1F2BNTDwwJweKY9lPz0W4Jzimb4pC37JTYpjtFLyW
         XsDQd0dPoHf74NRMKFT3HQxdHRpWnGI9GW8V2YTAgO4+CTXEgsfy9iMNLkL3CcQ8Lmsi
         HUwIM6ZhgiTWz5H3QlGvwrQWXcIWxzHorxCrzyYim/j8oSvykgDzWDY4eiaTnXYKwsHI
         vU+PQZtF4M10frjYn78SMtydK8SuR+UspgZ2sHXopQjA802tXJE6BPJnozf9grOhvQO8
         g8osD+Js7SOwKkLbgadN6JeECOTHs8UrGNVAT446om+hnLXPJ602QUDTgVbzcXFAplrI
         jf8g==
X-Gm-Message-State: APjAAAUHyNIFX0qXpE2P9HyYe7ODzjTTH16SWy5rjaqE7q9jyySUnkd2
        b79sWoW3auMA2pG4Jsos278=
X-Google-Smtp-Source: APXvYqzifQTLFY3fiCEc/aCe5r0tywrucZj0/32mwX7wx57DXNKGqpr+m2XRI14SLPpfAL6HJ9N/UA==
X-Received: by 2002:a05:620a:14a2:: with SMTP id x2mr2505784qkj.236.1574258960919;
        Wed, 20 Nov 2019 06:09:20 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([2804:14c:482:99:1a50:482f:3e7:284a])
        by smtp.gmail.com with ESMTPSA id y29sm14882679qtc.8.2019.11.20.06.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 06:09:19 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-imx@nxp.com,
        linux-watchdog@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] watchdog: imx7ulp: Fix missing conversion of imx7ulp_wdt_enable()
Date:   Wed, 20 Nov 2019 11:09:16 -0300
Message-Id: <20191120140916.25001-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Since commit 747d88a1a88c1b ("watchdog: imx7ulp: Pass the wdog instance in
imx7ulp_wdt_enable()") imx7ulp_wdt_enable() accepts a watchdog_device
structure, so fix one instance that missed such conversion.

This also fixes the following sparse warning:

drivers/watchdog/imx7ulp_wdt.c:115:31: warning: incorrect type in argument 1 (different address spaces)
drivers/watchdog/imx7ulp_wdt.c:115:31:    expected struct watchdog_device *wdog
drivers/watchdog/imx7ulp_wdt.c:115:31:    got void [noderef] <asn:2>*base

Fixes: 747d88a1a88c1 ("watchdog: imx7ulp: Pass the wdog instance inimx7ulp_wdt_enable()")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 0a87c6f4bab2..11b9e7c6b7f5 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -112,7 +112,7 @@ static int imx7ulp_wdt_restart(struct watchdog_device *wdog,
 {
 	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
 
-	imx7ulp_wdt_enable(wdt->base, true);
+	imx7ulp_wdt_enable(wdog, true);
 	imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
 
 	/* wait for wdog to fire */
-- 
2.17.1

