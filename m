Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AD63336E2
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Mar 2021 09:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbhCJIEk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Mar 2021 03:04:40 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:38713 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbhCJIDi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Mar 2021 03:03:38 -0500
Received: by mail-lf1-f47.google.com with SMTP id m22so31920471lfg.5;
        Wed, 10 Mar 2021 00:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=9neQuQcCRkWdtmxVlPcgyoaGEau3r59VmHEXSLbS1QA=;
        b=UGvYL0D2abWpiYTirBQMh7gTdh73p0BCke0kEfZdTXcakzObSupaBtHr0TX+DXSKgo
         sjJFHdB6R/hSV8oKz0XlI80IOhfikabEPxOGebPiPACX7wFZDxEmyNCk8X0AbS+k4vVE
         KtYBt6a22CRUnQKcO4hdhiYnzqsJZ9gDSz5G6ob45+ORSlXj+5OzEUHTIFrvwAujWq+m
         XdOL0zQqHdfU/6djXFCxQRDurfHmYwyrbzde0eXfhzGWt6qr/EnLHAAKriDR9BFe6gZW
         lTnWVj1Nj5gfa2Ip7dE2t5WkS1xnU3KEnHI409LgLu6Q+k2SYU0+UunJlQAC++kroAVq
         OXSQ==
X-Gm-Message-State: AOAM530ai6OI8UbuQQ6KAWwSZ7lxWlkWEt8bS1xmAdEKMaF6NUDVXAJF
        k8j9oHwAMdQvRenIqHbl+ha8jGo4q+Y=
X-Google-Smtp-Source: ABdhPJzkElfZtzI8QYQp80x3Rt54SrpKes6677h8tcUnsGYrUHeJMRBTEBMGVCpyP6VnDCSIZXbGFA==
X-Received: by 2002:a05:6512:695:: with SMTP id t21mr1272734lfe.61.1615363417270;
        Wed, 10 Mar 2021 00:03:37 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id p18sm2891316ljo.75.2021.03.10.00.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 00:03:36 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:02:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v9 0/6] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1615219345.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Initial support for ROHM BD9576MUF and BD9573MUF PMICs.

These PMICs are primarily intended to be used to power the R-Car family
processors. BD9576MUF includes some additional safety features the
BD9573MUF does not have. This initial version of drivers provides
temperature, over voltage and under voltage warnings is IRQ information
is passed via DT.

This patch series includes MFD and watchdog drivers. Regulator part was
already applied.

This series brings in the IRQ support which will be utilized by the
regulator driver(s). The regulator part was splitted in own series.

WDG supports
- Enabling and pinging the watchdog
- configuring watchog timeout / window from device-tree

Please note that not all of the boards are expected to be utilizing the
warning IRQs. Thus populating the IRQ information from DT is optional.

Changelog v9: (Changes suggested by Lee)
  - MFD: Update copyrights
  - MFD: use designated initializers in MFD cell arrays.
  - MFD: styling

Changelog v8:
  - Drop regulator driver changes which are covered by the separate RFC series.
  - Renamed regulator driver cell. Regulator driver change will be
    brought in in the RFC series to avoid conflicts.
  - Add patch introducing register definitions required by the regulator RFC
    series.
  - Cleaned comments at MFD as was suggested by Lee
  - Do not abort MFD probe if IRQ information for BD9573 is populated
  - MFD driver/header styling

Changelog v7:
  - Added interrupt handling
  - Added notifications and error_flag getter to regulators

Changelog v6:
  - Fixed watchdog timeout

Changelog v5:
  - rebased on top of v5.10-rc2
  - few styling fixes in MFD as suggested by Lee

Changelog v4:
  - rebased on top of 5.10-rc1
  - Fix typo (repeated word maximum) from the DT binding doc

Changelog v3:
  - use only one binding to specify watchdog time-out window.

Changelog v2:
  - dropped already applied regulator part
  - dt_bindings: Fix case for regulator-names in the example
  - watchdog: unify probe error check and revise includes

---

Matti Vaittinen (6):
  dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF PMICs
  mfd: Support ROHM BD9576MUF and BD9573MUF
  mfd: bd9576: Add IRQ support
  wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
  MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
  mfd: bd9576: Add safety limit/monitoring registers

 .../bindings/mfd/rohm,bd9576-pmic.yaml        | 123 ++++++++
 MAINTAINERS                                   |   4 +
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rohm-bd9576.c                     | 189 ++++++++++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd9576_wdt.c                 | 291 ++++++++++++++++++
 include/linux/mfd/rohm-bd957x.h               | 140 +++++++++
 include/linux/mfd/rohm-generic.h              |   2 +
 10 files changed, 775 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 drivers/watchdog/bd9576_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd957x.h


base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
