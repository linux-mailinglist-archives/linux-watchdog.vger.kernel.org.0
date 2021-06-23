Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F12C3B11E7
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 04:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhFWCrS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 22:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFWCrS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 22:47:18 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E182C061574;
        Tue, 22 Jun 2021 19:45:01 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id u18so1117968pfk.11;
        Tue, 22 Jun 2021 19:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ukleBmqzIpGM4yU6BPMvH09lh3OTDa2cYsNSJ3nPLR8=;
        b=TyN1gQL11qwfLDcx39jyQkRAkmxIqe/+31eEwGe4MiGfspVcaYvdC+Jz8HAJO6eHXS
         BEzFELqdsY5jbJDsBpW0FTUIub4kCgRI2EJx3PdfarOz4h13NvT2N2DgTbD/wT3PqfzD
         IoqqPDdcIDpm38c5qZYOXmvE+jye8Y83og6joyDxCnL2Z1QqdUi/YbqXoLNNMRq3imrM
         BoJqkaYg2XxiQ7GYqKZ6TB7X6vM3o9ZtIM0qqtTT0i2ZRwJQphFc+YLprZ8YaeOVssiB
         7rlrJV8Vm78v/MOFxuBMuiY3bBp80Sr6bVpGSG/dzGYIziRx/MIvSD4PjtCBofDrICXF
         qvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ukleBmqzIpGM4yU6BPMvH09lh3OTDa2cYsNSJ3nPLR8=;
        b=cT0FaD0Ka8CUwP5XiF8Vy6C3jrW8bxo2atiTS4VkS16EXVTCuhlDKjydWceOMXLBBV
         aaBXvpA8ZCvENBnSAhnRVqXI6Lg3P6gM5+TAG3ouFVWHNHRK0p4dysVH2VyL0QxnArCi
         bWnMJ6wg4YavUkO9ttxQlGK0Ov/CHEjRoiTHrNA1vkOfMN7ZV65xJh7i27x82L0N4DRi
         dCLWMboxe303ycmok2Xs2avkO9ZKTPwfixPr6gPr1x9SDnu+41kMwxdM152yam3BLemI
         zepJebrS7LPWlHtplPFkYsyNdtMjwbr5bKAXFjPSdbGPKLIps2t/pS5ciyzuDmwbeSYk
         wWFA==
X-Gm-Message-State: AOAM532+XUxs6MA6ejIVKMGhnCnH2QHA8gdTQdSlFqnJx9LNykBOuDB0
        4CK2cIK/5XeK0IsQKl3amt4=
X-Google-Smtp-Source: ABdhPJz8HDIKbB6CQrQ6YOtKvfhXIK3pg5WpG6McX20IWNwWHQCWMy8aD5gr19NU20lbCFPFC0jIpA==
X-Received: by 2002:a63:df56:: with SMTP id h22mr1646988pgj.224.1624416301246;
        Tue, 22 Jun 2021 19:45:01 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 19:45:00 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 1/5] watchdog: meson_gxbb_wdt: remove watchdog_stop_on_reboot
Date:   Wed, 23 Jun 2021 10:44:25 +0800
Message-Id: <20210623024429.1346349-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Remove watchdog_stop_on_reboot (still can be activated by
watchdog.stop_on_reboot=1) i think this driver configuration more useful
becouse we can get reboot waranty for abnormal situations on shutdown stage

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fbcfa..3f86530c33b0 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -186,7 +186,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 
-	watchdog_stop_on_reboot(&data->wdt_dev);
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
 
-- 
2.25.1

