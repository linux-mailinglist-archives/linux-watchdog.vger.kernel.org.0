Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6853139CA0F
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Jun 2021 19:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhFERGg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 5 Jun 2021 13:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFERGg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 5 Jun 2021 13:06:36 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19427C061766;
        Sat,  5 Jun 2021 10:04:48 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q5so12478315wrm.1;
        Sat, 05 Jun 2021 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8C6jG6nGggQG+6Slj5dToqq625sbmZefLgTytCBk2Bk=;
        b=KZ5MStztaijsB0hw63GAR5sXQMzKrhV+a67XWcm7/aTWDcPyoNh63+Yk/1CdJvzOyt
         4EYbElhKU40LZ0Fyi3XsRtTfyKR8e5ts3SbMKh9/N/pyvEJzQc2p4cjznIKE6mnqSDea
         2jjPMUJUL5XxwXkkNZ4+K+myE4PdZIntPhZDx3Lrg9g9kI7gbdr9eLXyG4kB2JQf8vx9
         NxMPkRzLLeLjiN+G5bb1rI0oJGwyepSuVoUgNM8Fp9VZdBd8IxdlC/Rs311WmC8IKJUz
         4vInW7mTsQ6VVh9SShJLi0LMugLE6CKYBVttERYZjuzgfB6THPVGzRzRX9SUFYeN2E6r
         3yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8C6jG6nGggQG+6Slj5dToqq625sbmZefLgTytCBk2Bk=;
        b=E36RB+X8bf1kqhSsBbPwQAY6Rjt1fKHB4vJsqFn0pmjQ278LtzUvocfr9Y0jxbGifE
         U1Y07+xBkNCo+ZUaYpPqCwqL1zzp3sVMbdXw/kfa7NUQiYwplxlY9Wc/mcXZVdpa5MMq
         skdSivKH16VD6jKKJkN1qoRMLJ5To6k4LQD1M1uPW0bTwebYKLc8nRa2iP4xd+VXtTtM
         zQaBO1w/4BcCEjAkpwBUz//C3gVMMi1ni8yQCofoS0QNAyHRH3tfQyXvojdv/YlF94wd
         cEVqwl+RjNLQF2hldVSBHBO45aMQB3lRywCNbE+CrUfJUtTTWH0rGupnMbsGDI1NJjtZ
         QLqw==
X-Gm-Message-State: AOAM533OAiuOw0lD6wXv41lVM9Rkk6G9V8tGqgJv/swMHPBT6H9P2W5J
        PTUx6rtiBimo+Fhjj+KI75LMIAVJzBw=
X-Google-Smtp-Source: ABdhPJw+OJ//psBuKgMQcdNiqdbQ2K12q22AyzVfabVnVqtFzU8y75QZaaJtUh3xU4uMGtQY3pigDA==
X-Received: by 2002:adf:f98e:: with SMTP id f14mr9340411wrr.408.1622912686452;
        Sat, 05 Jun 2021 10:04:46 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id i2sm8501098wmo.40.2021.06.05.10.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 10:04:45 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Add watchdog for Mstar SoCs
Date:   Sat,  5 Jun 2021 19:04:38 +0200
Message-Id: <20210605170441.33667-1-romain.perier@gmail.com>
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

