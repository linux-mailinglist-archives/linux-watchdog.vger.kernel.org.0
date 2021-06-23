Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7423B11E5
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 04:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbhFWCrM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 22:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFWCrM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 22:47:12 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDEFC061574;
        Tue, 22 Jun 2021 19:44:55 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id u18so1117633pfk.11;
        Tue, 22 Jun 2021 19:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1t1JCMbZ7H8AYhNf5B3sG0rOvYwG5DgsfZBnh4OVPvs=;
        b=cXYORpQtVJdzCcURXhy4rLlvxgRxlfwkJBB0Nyj6MwjbG5EaNtfZx8C/S0NpjsuYNE
         pJoCGUOG+clKT4Wl9YKDIz97wLYxyLGrsyvUmSEsDckbDjaYyuolafQ/wbE16z5dhO4O
         rgr4tLiT1ALz2qE1VVgyVGMivCP9I9OjCsBQrMsSkDRMSBbCeWN/r8M6ojzD68JK9cBh
         01FM584mkb2AszQczhXnmdpMI/7CRlIXmvYWmKt9lukkfO4Jd37BbOLNApHd3tlGCaEA
         WW6MYwRfXdvKUFggSRlOxg6xy1WUVk+djvNrIpIpq3RNMNly5gdm4dr1pHJOFKjVYSFZ
         sVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1t1JCMbZ7H8AYhNf5B3sG0rOvYwG5DgsfZBnh4OVPvs=;
        b=He1KC6HuhcUGc4BJZaXEuFT909+4xVs6SN9V4sgstLhPSu9WatC62vrPdIpoyiO2c2
         JYZKYGa18KCAsm4/kiBsBWsiAimNrMg1tGw8eC3askim5IQaLZ8BBBP0yZVQwZISBCos
         NH+fLKNIhs5w4U+q6ccsNI0Nmpg8k3SmHPKA05SRzbHMEZ2tvz0fLOw2TEUeuPaIMWxS
         7P8g9GYowTR1L30ThkW5bC2Y5A3n+Se1PRttn/CfI2RYlylU8sWpiMy8r5iCKcWmk9Zc
         yrGpoValSiErz8esQ/DjAuV+kfyWMoGMBtCvq8JuKZ7ZuzsdBYFHYJ0jH9QFuWDONc8/
         dzxQ==
X-Gm-Message-State: AOAM533LR6BE8qG7lF9SrYQmhjGMvyWt0w4veXxJPHdUf7uOkEfR7m8f
        CUHsHg9CntJt8UlU4CvNsQE=
X-Google-Smtp-Source: ABdhPJyZgfUKL63O+Xw5p7Bwz0pnfFl5NrhCmCzvLTq213sw02oIq14awyEbyEGd5TZLB9xKtafVhQ==
X-Received: by 2002:a63:ff1f:: with SMTP id k31mr1581554pgi.315.1624416295423;
        Tue, 22 Jun 2021 19:44:55 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 19:44:54 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 0/5 v2] watchdog: meson_gxbb_wdt: improve
Date:   Wed, 23 Jun 2021 10:44:24 +0800
Message-Id: <20210623024429.1346349-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Try to improve meson_gxbb_wdt driver to common view:

* Remove watchdog_stop_on_reboot (still can be activated by
watchdog.stop_on_reboot=1) i think this driver configuration more useful
becouse we can get reboot waranty for abnormal situations on shutdown stage

* Added timeout module param same as in other modules
* Added nowayout module param same as in other moduels
* Added missed watchdog_stop_on_unregister call
* Print watchdog success driver start status notification

Artem Lapkin (5):
  watchdog: meson_gxbb_wdt: remove watchdog_stop_on_reboot
  watchdog: meson_gxbb_wdt: add timeout module param
  watchdog: meson_gxbb_wdt: add nowayout module param
  watchdog: meson_gxbb_wdt: add stop_on_unregister
  watchdog: meson_gxbb_wdt: add register device status notification

 drivers/watchdog/meson_gxbb_wdt.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

-- 
2.25.1

