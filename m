Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961973A49E5
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 22:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhFKUKO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 16:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbhFKUKL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 16:10:11 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52409C061574;
        Fri, 11 Jun 2021 13:08:11 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id y13-20020a1c4b0d0000b02901c20173e165so1359760wma.0;
        Fri, 11 Jun 2021 13:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pQvBGQPM+4w1LJKirfQgMfUIzZPFlCZTOGktZwuQaYc=;
        b=jNJBfNd8zZ3ivpE/UxiHzzZYXgzlr6uaLwqoXf2DRIYslOfPlxFmUjSlqFOxk0LhUo
         fmNV84jBpmxEMT0wO95CO9jJVJuaPeEMcAw916ICzJT/bUoeni8d7QL08vCKYuweZe4W
         DNySCVSj5y62WlbDF8x2HawYxiBVWlwKSFt/bjsyLu7U+PeQAKQVG6rCfnI3CqUzn3BE
         Bz5t7Qw395Nvd+kGJlk09VNRt26+ic4fncGcFUA7EndBGyOS0rmbnKnsRvVwI4UxO+d3
         KpAAiMNG0RfXStzNwvFL5YELCC52zDtDQxfKRSUI3icDYjcTQIVnPaGAITwW0iQ+OA3Z
         oYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pQvBGQPM+4w1LJKirfQgMfUIzZPFlCZTOGktZwuQaYc=;
        b=JW8X+G/kAI9JwhxG6vE/gaqKj3MtdKdtmQycu1rppP+3ouVZv07KqFv2LP/TeDvkum
         tzjNptOtdbwaTZQy66G9J7eLgjjYfPZ8udXqxYf22ENA179ucV9j6ai8trRIAbn6/nPd
         Q55mflJma2Jlqei29EzCdyglfdRdLwMxpDxIYotSZkLism/rFsSbSEbbLr8GplAY9YLi
         Sn+LakN6Z8ntcFUj9zE1LJCW7TZrQ8lvsOj4LsjbVZqCbRzTj64DFhjk72m4kdPIKNKa
         m1qv7SmZTMuHsDGZ411hJpER+ObKKxfPI2x6d2f0OzriUw+dTOMPtWDpfKvV1XdcrQoo
         BrGw==
X-Gm-Message-State: AOAM532qxFXG86Y/MZfzCmmHwyU6HHxsioiCXjrVnBn1pdeit/kTIavi
        yRhTmbtHe+Alr54z5ZSbbm8CI0xJi0A=
X-Google-Smtp-Source: ABdhPJzmmt4gAVNToIzO9KFeAllKOw033ujMqZUMWvszjzkU44Fm2edAqQp9/A0HGoQzRhnzlgL8fA==
X-Received: by 2002:a05:600c:251:: with SMTP id 17mr21757584wmj.137.1623442089640;
        Fri, 11 Jun 2021 13:08:09 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id l16sm14167072wmj.47.2021.06.11.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 13:08:09 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add watchdog for Mstar SoCs
Date:   Fri, 11 Jun 2021 22:07:58 +0200
Message-Id: <20210611200801.52139-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patches series adds a new driver for the watchdog found in the Mstar
MSC313e SoCs and newer. It adds a basic watchdog driver, the
corresponding devicetree bindings and its documentation.

This work has been co-developed with Daniel Palmer.

Changes since v3:
- Rebased onto v5.13-rc5
- Added Reviewed-by tags

Changes since v2:
- Renamed the dt-bindings documentation to mstar,msc313e-wdt.yaml
- Fixed the subject of the first commit
- Dropped unused dt labels

Changes since v1:
- Dropped "depends OF" from Kconfig (not required)
- Dropped unneeded include files
- Re-ordered include files
- Compute timeout_max dynamically from the probe function to avoid
  an overflow in _start().

Daniel Palmer (1):
  watchdog: Add Mstar MSC313e WDT driver

Romain Perier (2):
  dt-bindings: watchdog: Add Mstar MSC313e WDT devicetree bindings
    documentation
  ARM: dts: mstar: Add watchdog device_node definition

 .../bindings/watchdog/mstar,msc313e-wdt.yaml  |  40 +++++
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/mstar-v7.dtsi               |  14 ++
 drivers/watchdog/Kconfig                      |  12 ++
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/msc313e_wdt.c                | 166 ++++++++++++++++++
 6 files changed, 234 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mstar,msc313e-wdt.yaml
 create mode 100644 drivers/watchdog/msc313e_wdt.c

-- 
2.30.2

