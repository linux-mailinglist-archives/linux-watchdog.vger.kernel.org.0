Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F863AD32C
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Jun 2021 21:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233494AbhFRTxU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Jun 2021 15:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbhFRTxT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Jun 2021 15:53:19 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99556C061574
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Jun 2021 12:51:08 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id q20so18495777lfo.2
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Jun 2021 12:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xMVSNrHGcdt1vbOgCt0p2SZ9LSnvDYsg9SnZkED+C08=;
        b=OI+p8vNSYtg5dOKoFneDPR48HNRCn5+KtmQCC1iEiqeAkn90I7DNnoQ+1FM+nplYfP
         3G8Bcf6gj2Veo22h9O+8GD5/NmlqM8wVuLUEXuYSQW2TiFmCI9geu61KyyJITWbw4dD5
         RwtGyFY+nmPaVQBF6pZuo1fQ5EWDOIUpdiyQjvXGWoHvzaqaB4tHqISE3lOa0p8JVH16
         aKRi/LfxMyvI08TLkYOS1nt2K6i8a6wCsffNAMk+B9/AG43n4M7EhkqVyFlW4QlHAsA+
         CEvkfsnwzQ7BtnmuP9WaFc5g9E2fRp9jQnDGC/Ik0UMdQ36Z4YnZa6uPHeMXDgmvtEFc
         DvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xMVSNrHGcdt1vbOgCt0p2SZ9LSnvDYsg9SnZkED+C08=;
        b=eF0pUrK9yg0YM9shrE1OLe7W+OvFB0UU9jer9IySRtLNGzyqBwFH61qNYocMgZ4ivR
         rD5Gc6ohnHoZoGTfzqVdm44Lsg7D/t4M7pP/IWueU6Yw+tFP/9SJRi5ee+Et827uWpcN
         aqQgoXPb6GRykiFtyYOClwqntye/2y3IzgJMBPXX+nYaNCc8re9NArAtzcdZQC/+6IPR
         qEjOsVdU5UKKD6gwdCEgNMeXLFSMtMtXB/k11e1YFeIzUD9lFAWpzVlYzqeC88qSxVnK
         0zpMX34mBog2IRIgGTf19EcozzLRAICtBzBg47Why9ITPNNZB8vBjQ4I7vO5hgyA5kWU
         JhSw==
X-Gm-Message-State: AOAM532zWDBmlFCAJRiucUo0y8RSHk6O1o4Q3a/ghs16/v7mX+n/5mXV
        dafgqDc7zkeCwsX1Q1Q2azzc4Q==
X-Google-Smtp-Source: ABdhPJxTn9yUM//lgUINg3OMvXib0w3U1/wNLfUqdwLiM++zP7wiXYpSlpAY/I1XHz3rygGFqrs0KA==
X-Received: by 2002:a19:24c3:: with SMTP id k186mr4452699lfk.472.1624045867006;
        Fri, 18 Jun 2021 12:51:07 -0700 (PDT)
Received: from gilgamesh.lab.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id o7sm993221lfu.215.2021.06.18.12.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:51:06 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        grzegorz.jaszczyk@linaro.org,
        Michal Koziel <michal.koziel@emlogic.no>
Subject: [PATCH v2 2/2] watchdog: imx2_wdg: notify wdog core to stop ping worker on suspend
Date:   Fri, 18 Jun 2021 21:50:33 +0200
Message-Id: <20210618195033.3209598-3-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210618195033.3209598-1-grzegorz.jaszczyk@linaro.org>
References: <20210618195033.3209598-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Suspend routine disables wdog clk. Nevertheless, the watchdog subsystem
is not aware of that and can still try to ping wdog through
watchdog_ping_work. In order to prevent such condition and therefore
prevent from system hang (caused by the wdog register access issued
while the wdog clock is disabled) notify watchdog core that the ping
worker should be canceled during watchdog core suspend and restored
during resume.

Signed-off-by: Michal Koziel <michal.koziel@emlogic.no>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v1->v2:
- Do not use watchdog_dev_suspend/resume directly, instead notify the
watchdog core that the ping worker should be canceled during watchdog
core suspend and restored during resume.
- Commit log was updated accordingly.
---
 drivers/watchdog/imx2_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index b84f80f7d342..3e8d9c3b6386 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -311,6 +311,7 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(wdog, nowayout);
 	watchdog_set_restart_priority(wdog, 128);
 	watchdog_init_timeout(wdog, timeout, dev);
+	watchdog_stop_ping_on_suspend(wdog);
 
 	if (imx2_wdt_is_running(wdev)) {
 		imx2_wdt_set_timeout(wdog, wdog->timeout);
-- 
2.29.0

