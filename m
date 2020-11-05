Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719BB2A7D3A
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 12:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730407AbgKELhZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 06:37:25 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40820 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730568AbgKELhY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 06:37:24 -0500
Received: by mail-lf1-f65.google.com with SMTP id e27so1807185lfn.7;
        Thu, 05 Nov 2020 03:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nS45yyZNp7fVZijqS9qiF6xN7pmeG/2OUYLO/JQ/Ll0=;
        b=swOyl9A+QQoq2vlks6pzq2tQuqf8VMuvzJ3jmXW7MhYnfb6P4Hy+C08HERDYfmawcF
         OMd8D1u6bEuiyeOpeubSnGZHqncSqfenVywH+i2Gen8uDiip5EaItEY4iLQyN9FIC8Dj
         b8RpBkuTaT++xD9mNHtt1n4tvtlClgdNek1Y39aMIpzSYiubobL3XYPYKVxiY3ouVJ3K
         y4wtuyAnF65f1V7eAYH7PGwcvgfxq9naFrwdYv+wtOTRooScf3GoXETUdOh6T+v63MPg
         ksXCfxfMCqZ4bBPzMTwT28g8Vj5If6lRrPzLMQ0SmcSv7FDwadwUlqeBYDocTvFGvZLF
         nwAw==
X-Gm-Message-State: AOAM5335hPOrHCH6Jw/5+4RLPT332YoDOspxXLWh6WRDmDx4vH7AvMV3
        gCRTyE/s/ga3SyzzheRM6a8=
X-Google-Smtp-Source: ABdhPJyYWJfbYbGkMxN0l3iVA2R6V/LwyxcH6I3utG/EctET16WoGY2VXlgpIb94KcncPMLWk+1DTA==
X-Received: by 2002:ac2:554c:: with SMTP id l12mr762776lfk.35.1604576241360;
        Thu, 05 Nov 2020 03:37:21 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id u3sm155697lfm.57.2020.11.05.03.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 03:37:20 -0800 (PST)
Date:   Thu, 5 Nov 2020 13:37:13 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v5 0/4] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Initial support for ROHM BD9576MUF and BD9573MUF PMICs.

These PMICs are primarily intended to be used to power the R-Car family
processors. BD9576MUF includes some additional safety features the
BD9573MUF does not have. This initial version of drivers does not
utilize these features and for now the SW behaviour is identical.

This patch series includes MFD and watchdog drivers. Regulator part was
already applied.

- Enabling and pinging the watchdog
- configuring watchog timeout / window from device-tree

This patch series does not bring interrupt support. BD9576MUF and BD9573MUF
are designed to keep the IRQ line low for whole duration of error
condition. IRQ can't be 'acked'. So proper IRQ support would require
some IRQ limiter implementation (delayed unmask?) in order to not hog
the CPU.

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

Matti Vaittinen (4):
  dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF PMICs
  mfd: Support ROHM BD9576MUF and BD9573MUF
  wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
  MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers

 .../bindings/mfd/rohm,bd9576-pmic.yaml        | 123 ++++++++
 MAINTAINERS                                   |   4 +
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rohm-bd9576.c                     | 108 +++++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd9576_wdt.c                 | 290 ++++++++++++++++++
 include/linux/mfd/rohm-bd957x.h               |  59 ++++
 include/linux/mfd/rohm-generic.h              |   2 +
 10 files changed, 612 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 drivers/watchdog/bd9576_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd957x.h


base-commit: 3cea11cd5e3b00d91caf0b4730194039b45c5891
-- 
2.21.3


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
