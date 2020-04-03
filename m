Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC1C19CFC0
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Apr 2020 07:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732784AbgDCF3Q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Apr 2020 01:29:16 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33533 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732711AbgDCF3Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Apr 2020 01:29:16 -0400
Received: by mail-pf1-f193.google.com with SMTP id c138so2963578pfc.0
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Apr 2020 22:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TWUVEWHfILYD4mLoLxiKPBxfXnp3kNrR0NuQf2K0ahQ=;
        b=Xi5KMTsZkOO7QTHFIZYuRuEr2Z/+6lNWa58ajHP5SQHleic4V+fa3OVt47Iv2/Ytlo
         AXpJAyiP3yJ3dlaDdpHDhDZFU6cTeYM5BpcgJRXE6fBovCc7bjdG4NRusRfkdLgkky0y
         VuKqJHgsxIvuagj4lAOrlp9zMnQUOMncAdPIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TWUVEWHfILYD4mLoLxiKPBxfXnp3kNrR0NuQf2K0ahQ=;
        b=Qb1lxEKn7PQ4TZyaXSJwqSugSWUmcHgZYTZ4w3c5ilcXmyD6gyAZmgDZY2XBt4Lr8+
         4Jb34kMmIE+VugehqT70JlzB50dYvAZkLGCULX/QlN+QSI/D+hALDtKLZX6IIDb/cqG/
         pWMLeSNgEGIwJ03nel0bO96UTwpThGbNXEGIf+r0T1QDhwtK3TrwxUIPUcjxfPGO3821
         +G5yXbXHmVImOPfg6dQWB5NF0CKPeTyIK1T2LwzA8TMyB7+xjaZ3KdbE0IUYRz06s2bj
         XanWiAzRRH+veOjoHmRKwlyawhqCKex/7n/8JC/cEHA4XS/LuG8GwOkTI8vLOySvcgza
         d/fA==
X-Gm-Message-State: AGi0Puak9WNkDVoQilWFJiki7Ny3PCieM3SOZDG59OmaRj0DthlsZnox
        s6RriKJOMrmMwRZc3t/8I8UuSg==
X-Google-Smtp-Source: APiQypJwFGVlMhKNjzHxxikpLJzTjv9S0yp8wd3gigfUtQE9RxnY+jxENnaohkQ5QkAddaxMxtczTg==
X-Received: by 2002:aa7:961c:: with SMTP id q28mr7020119pfg.177.1585891755586;
        Thu, 02 Apr 2020 22:29:15 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id c21sm4451578pgn.84.2020.04.02.22.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 22:29:15 -0700 (PDT)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     xingyu.chen@amlogic.com, jwerner@chromium.org,
        Evan Benn <evanbenn@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor Calls.
Date:   Fri,  3 Apr 2020 16:28:58 +1100
Message-Id: <20200403052900.258855-1-evanbenn@chromium.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is currently supported in firmware deployed on oak, hana and elm mt8173
chromebook devices. The kernel driver is written to be a generic SMC
watchdog driver.

Arm Trusted Firmware upstreaming review:
    https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405

Patch to add oak, hana, elm device tree:
    https://lore.kernel.org/linux-arm-kernel/20200110073730.213789-1-hsinyi@chromium.org/
I would like to add the device tree support after the above patch is
accepted.

Changes in v3:
- Change name back to arm
- Add optional get_timeleft op
- change name to arm_smc_wdt

Changes in v2:
- Change name arm > mt8173
- use watchdog_stop_on_reboot
- use watchdog_stop_on_unregister
- use devm_watchdog_register_device
- remove smcwd_shutdown, smcwd_remove
- change error codes

Evan Benn (1):
  dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog

Julius Werner (1):
  watchdog: Add new arm_smd_wdt watchdog driver

 .../bindings/watchdog/arm-smc-wdt.yaml        |  30 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/watchdog/Kconfig                      |  13 ++
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/arm_smc_wdt.c                | 181 ++++++++++++++++++
 6 files changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
 create mode 100644 drivers/watchdog/arm_smc_wdt.c

-- 
2.26.0.292.g33ef6b2f38-goog

