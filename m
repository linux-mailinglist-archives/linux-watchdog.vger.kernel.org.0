Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66314300576
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 15:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbhAVObi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 09:31:38 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:37457 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbhAVObU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 09:31:20 -0500
Received: by mail-lf1-f46.google.com with SMTP id o17so7797277lfg.4;
        Fri, 22 Jan 2021 06:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ugLiuQOEK0qq8OxwCqTnBppHOnA7l9CtHOFSwbtCQPE=;
        b=oN+xgA2Zv0q9GO4msf2EU2N4tY+36zqR4S5sV2rgiBDuEHgWSh38m4b7Bb1dYCCh90
         2jd9J/JOK8Va+QrmJKFkbfY3/IAtkF28Yozr05t0R8cyUlsWfTwL6bImdJmDLRxa147d
         5bGpUdoga/nJrz2LXuCIGwIWn/DPzOuvCm4AFgs60lazmBIg9RItRPjiYt4Huzv9CFAP
         1rps9jvNElYLXHSyTBwNo4q2eNpB0gu/s3JaX6JhGdXuN0/3RLVDBtZG3dj6QigsBzqQ
         whkcUJiWp5ym7MDQ1uv7aMgbsmFfGkhccvakXCb2dsaNPrPQARl13iruVqW4yTy1IeBB
         IGhw==
X-Gm-Message-State: AOAM533JQaVYOf9vjlFhhGiYyL1bTzCBknyKTZcGWrpOESPrkWip5GWC
        JCWh3vVgVaSL4S/e0ui0CPI=
X-Google-Smtp-Source: ABdhPJxBFzG0J/vnuPhp4YbfskIxOiJTfu4eJ0OikZXj2FN/Ip/uwIHpMCwSiAQNNkvlQW2vDCsN5w==
X-Received: by 2002:ac2:57c9:: with SMTP id k9mr2333362lfo.165.1611325837532;
        Fri, 22 Jan 2021 06:30:37 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id l15sm900705lfg.272.2021.01.22.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 06:30:36 -0800 (PST)
Date:   Fri, 22 Jan 2021 16:30:29 +0200
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
Subject: [PATCH v7 0/6] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
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
already applied but this series brings the over-/undervoltage and
temperature error notifications which consumer drivers can utilize.

WDG supports
- Enabling and pinging the watchdog
- configuring watchog timeout / window from device-tree

BD9576MUF and BD9573MUF are designed to keep the IRQ line low for whole
duration of error condition. Yet the IRQ must be acked before line is
pulled low. This means that handling the IRQ as edge triggered IRQ
will introduce the classic race of new IRQ occurring while one is
handled. (New status bit being set just after status was read but before
it was acked. That will cause the new IRQ to not be acked which leaves the
IRQ line low. With edge triggered IRQs this means that no more edges will
be seen.) In order to prevent the processor from staying in IRQ handling
loop we only handle the main status register with regmap IRQ
irq-controller (main status bits can be masked) but leave the sub-status
bits (some of which can't be masked) to be handled by the IRQ handlers.
When regulator driver handler is run, it will 'increase the depth' of IRQ
disabling (causing main status bit to stay masked when handler exits)
and arms a 1sec delayed_work to do unmasking. I am open to suggestions as
how to handle this more elegantly. Please note that the BD9573 does not
offer 'warning' interrupts and will only generate IRQ when it is
entering into emergency state and shutting down the power from the SOC.

This far the IRQ logic has only received a limited amount of testing. I
managed to get the OVD/UVD condition by probing break-out board
manually. This however usually did  lead the PMIC to go to emergency
state so there may be corner cases not covered by my tests. Basic IRQ
limiting seems to be working though.

Please note that not all of the boards are expected to be utilizing the
warning IRQs. Thus populating the IRQ information from DT is optional.

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
  regulator: bd9576: Support error reporting

 .../bindings/mfd/rohm,bd9576-pmic.yaml        | 123 ++++
 MAINTAINERS                                   |   4 +
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rohm-bd9576.c                     | 186 ++++++
 drivers/regulator/bd9576-regulator.c          | 534 ++++++++++++++----
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd9576_wdt.c                 | 291 ++++++++++
 include/linux/mfd/rohm-bd957x.h               | 121 ++++
 include/linux/mfd/rohm-generic.h              |   2 +
 11 files changed, 1165 insertions(+), 122 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 drivers/watchdog/bd9576_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd957x.h


base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
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
