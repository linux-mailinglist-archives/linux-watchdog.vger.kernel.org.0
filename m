Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE889CFC68
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Oct 2019 16:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbfJHO3O (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Oct 2019 10:29:14 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42402 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfJHO3O (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Oct 2019 10:29:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id n14so19630993wrw.9
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Oct 2019 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=O2DKR9eVO5OT6dZUmMuRNe3VzeLrEJcFDO2ZD+CSBCY=;
        b=My8MUZ5BeTlbJ4CYKc+YscCMzGsj99j9TCvOMv+gpxNHWLucCPr3Z7HdsknPFFYfGM
         d0jbIVYN3mrf2AW75uCOahJri4qJ/gr+6N/Nw2fquJqBbXugNxRBK+GpDO74dF26u/WW
         AcnxtmyJReYEbXo+TvK7Fbl5J3YE5pG+WqFDx/RF4Ay+GwuEHDWs8UMOB5Y4D3XHnMvK
         mKdn3H5JGGklX98DZHKbLnKJyl1ZKyvKdG5tJYxGNPdiCXhL3Y4nmx8hDEeuGgNc/omB
         jf5PRirw8tnOSf8485yjv2YPNnVr/9+AGQ6+zd3D1Q0p9SEj8CUUmHueRjasBU4PBBei
         DWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=O2DKR9eVO5OT6dZUmMuRNe3VzeLrEJcFDO2ZD+CSBCY=;
        b=jbz7+j4Tdx+wl9ozg723gTSv5B0RET9RW6u3HOV/CSPQvXqaDQdF9DfNuJNEzDSo+w
         t1bK2kM9QTB1jzwYztC5vJx90aNTdI9DIu+3MNoD6sw5KBbSfinSwghAYQx9ABCWRHRj
         o6FeU/0aqFGbQmRjMKbiP0kAyNW4XsQM7PEt4zwolKF92qlUcm9PLwmgyJh5afU2VPbV
         ZRuw3YW9NE92wpzhriNOfwamSWJ2IOCK+SPd72pclD/cWzIUnIm6OYPwcot6zGCtg6Ss
         g3LRKr54iGFK8eFgjaGGOJlu8m776dyaYsqZ7JR5c/1hj3MWnAPKKB+bdo3hQLO6lK9L
         Cdaw==
X-Gm-Message-State: APjAAAX2+YZMQ+esiVTekr7mX80yQ2swym4EBrX07aXnxhd699JRJMea
        ltG9fk60U7iocYl8+T9xt/C4k1M3Z7mDxIpA
X-Google-Smtp-Source: APXvYqzIOQi91UO0cOPTnKrWsL9UFz2PFIb85TvBoICGl8cGkXjDiCeyM9zGLzXDfEQm7OIMutwrmw==
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr24378359wrw.158.1570544951950;
        Tue, 08 Oct 2019 07:29:11 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id a13sm48136827wrf.73.2019.10.08.07.29.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 07:29:11 -0700 (PDT)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: cadence: Do not show error in case of deferred probe
Date:   Tue,  8 Oct 2019 16:29:10 +0200
Message-Id: <d3e295d5ba79f453b4aa4128c4fa63fbd6c16920.1570544944.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There is no reason to show error message if clocks are not ready yet.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/watchdog/cadence_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
index 76d855ce25f3..672b184da875 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -335,8 +335,10 @@ static int cdns_wdt_probe(struct platform_device *pdev)
 
 	wdt->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(wdt->clk)) {
-		dev_err(dev, "input clock not found\n");
-		return PTR_ERR(wdt->clk);
+		ret = PTR_ERR(wdt->clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "input clock not found\n");
+		return ret;
 	}
 
 	ret = clk_prepare_enable(wdt->clk);
-- 
2.17.1

