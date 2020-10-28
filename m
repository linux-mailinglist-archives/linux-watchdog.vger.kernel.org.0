Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DDE29D49B
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Oct 2020 22:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgJ1Vx2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Oct 2020 17:53:28 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33517 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbgJ1Vx1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Oct 2020 17:53:27 -0400
Received: by mail-lf1-f68.google.com with SMTP id l2so766209lfk.0;
        Wed, 28 Oct 2020 14:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=B/Uh8Mjxj70GqN4e6bC2jcGCEwyOED4qRiTj7eOFPOc=;
        b=q8Hqkjenyae+adKAHtM6BqLkyv2DDY31SclVL/PUxc4/9Wrk3LaaJd72RHw/SKEA/B
         DHlvKGg2b8+1BH6S+8mJdiNeyNzVHLM0wSuDqS2eZCdmmmvEr2Aeo8jL7IZUBnexnvaW
         sn4nYAN3ykPncxcyfreSGyUA7fOsxZMm+StvI979keBtFm4pgGbktNTIXRVIfMQeFRpn
         +uBetW3hMFSUwo3M6oP6Zf6vvBAaFcX2x5vs/wqaOCPr7kwWTXdQwiaFtFk5caUxgFHJ
         QyHnX4T85Pcj3dA5RGsyYUxDkxcMmcGTwZT8JxZVIKwowzDzcqezdlzkNzA1w/W/qPG0
         yX9g==
X-Gm-Message-State: AOAM533acrA9AgEAZj6WOHJ4mEQK9LN2zHydxRvn1UA6mID53E3l+Zc1
        XlYYAnKI8eZe2y9K5QG5Z1XAqt6riRO0sg==
X-Google-Smtp-Source: ABdhPJz0Sa7eG4YThApVZWur5qzm6uMCWvxrV014/0GVslKKoUWqx9NmSYiEY6KbNcBZzcEr8d8OCA==
X-Received: by 2002:a2e:8750:: with SMTP id q16mr2653847ljj.53.1603878334962;
        Wed, 28 Oct 2020 02:45:34 -0700 (PDT)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id u11sm525138ljl.38.2020.10.28.02.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 02:45:34 -0700 (PDT)
Date:   Wed, 28 Oct 2020 11:45:27 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v4 0/4] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
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

Changelog v3:
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
 drivers/mfd/rohm-bd9576.c                     | 130 ++++++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd9576_wdt.c                 | 290 ++++++++++++++++++
 include/linux/mfd/rohm-bd957x.h               |  59 ++++
 include/linux/mfd/rohm-generic.h              |   2 +
 10 files changed, 634 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 drivers/watchdog/bd9576_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd957x.h


base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
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
