Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E3131876E
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Feb 2021 10:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhBKJxG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Feb 2021 04:53:06 -0500
Received: from mail-lj1-f180.google.com ([209.85.208.180]:41421 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbhBKJrA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Feb 2021 04:47:00 -0500
Received: by mail-lj1-f180.google.com with SMTP id e17so6592831ljl.8;
        Thu, 11 Feb 2021 01:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZEJ369A6XCWffUy/foTv3zEVJVD61SEeMj7wTUfLcuQ=;
        b=a4rmfmngJjO5osXDnF+L2QqOfG6/nZgXXSU51PzZrR4D2MSSrE6LBT5qosqaV3v9FU
         3eWp8oOTeQgp6tpT5NhGjAf9oNVKHQymDVJ2PS5e+m988k5m3GI5kODjVuKhgAX8VeQ5
         qT8Yg4SzYrslMBrZ6Kfc6IgfaFwlca51YF0rCAHcm1qkufVq0L1TjI6/IClTaccYiG+Y
         Bbx4zuHNjfqZijGsG0XQ+Z+yWvEciCjO2c5hfGFlvf023Dyz5xv7n+XEuidXEsLv0S/M
         vLYBhrEhGzzj3Z4h2Xv4C3i6Rn1aSq6/MqqRHTLDQ+2NOgcUcvQuBJkNcf1ENAlmdVy0
         w3ig==
X-Gm-Message-State: AOAM533/AgjkivHAipZqyeBT7us78yGfrDWSUV3GY1Cw7GHxwC1a3abm
        DBxKyZqVQBNVBf9wz5twkbQ=
X-Google-Smtp-Source: ABdhPJxVtKG5Prh3cGFwkmJcg8W9SNMT4u1ApdrimoEqtDHvSV3l78ZuEpkrTBnwsQXlo9X6EyEXSg==
X-Received: by 2002:a05:651c:38f:: with SMTP id e15mr4429041ljp.420.1613036776825;
        Thu, 11 Feb 2021 01:46:16 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id e15sm606319lfn.80.2021.02.11.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 01:46:15 -0800 (PST)
Date:   Thu, 11 Feb 2021 11:46:09 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v8 0/6] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
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
regulator driver(s). The regulator part was splitted in own series as it
contains some changes to drivers which are not yet in other trees.

WDG supports
- Enabling and pinging the watchdog
- configuring watchog timeout / window from device-tree

Please note that not all of the boards are expected to be utilizing the
warning IRQs. Thus populating the IRQ information from DT is optional.

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
  - watchdod: unify probe error check and revise includes

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
 drivers/mfd/rohm-bd9576.c                     | 187 +++++++++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd9576_wdt.c                 | 291 ++++++++++++++++++
 include/linux/mfd/rohm-bd957x.h               | 140 +++++++++
 include/linux/mfd/rohm-generic.h              |   2 +
 10 files changed, 773 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 drivers/watchdog/bd9576_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd957x.h

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
