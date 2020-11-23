Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F56D2BFFFB
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Nov 2020 07:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgKWGTv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 Nov 2020 01:19:51 -0500
Received: from mail-lj1-f179.google.com ([209.85.208.179]:38743 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWGTu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 Nov 2020 01:19:50 -0500
Received: by mail-lj1-f179.google.com with SMTP id j10so4292508lja.5;
        Sun, 22 Nov 2020 22:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=xO2tsY1hayMtmxfBz1WCoqicvFhDHRoS5hR7/YuNuNI=;
        b=V/bwmQCfhH3b3TPm0Avw9nQMZRF6QlxkJex1eKLXn7NW90+XIZ9A32GMp0jdBZ8rtX
         sY+FLi9hDLhoosSxDUF4YoWwbcP0CTomawURacVDERvxWjQ4z5gz4d7QVyv2WGCMFEsu
         i9PEnP8FOJiuX0WBhM9Dszacmw2KHBa4E0ntTdLOSNALqOCaI/WwYgQcBEHb7Ak4N43/
         e6DmbBidZxjrjF8IKS6QzRNzjCKh/sqz2WQlhBXf6jryYEHg4cgZGE+J0R0AO2UNXAaV
         Q8+xxWDGPAcjuAko5ZnkEA9TIkaKqzJhgoh9lPpI1SG5iF8nwmFoXGqNHKB6bZHf96wM
         hZgQ==
X-Gm-Message-State: AOAM531e4KkBf9iw1whYd1UbGUcybbZdKGsiGl9vGhgSRhJGtwJTrCAb
        UUt+g3VJUzxoZ6WtQgS3kJhs8cOuSkWM/Q==
X-Google-Smtp-Source: ABdhPJy5KYQHH7TjswJSEmgMyubj4UU79NgYzmAAvQF4J2g09XcuMFl5oyvpSTnQt8uXxK9UGHDcSw==
X-Received: by 2002:a2e:585e:: with SMTP id x30mr13238737ljd.426.1606112388178;
        Sun, 22 Nov 2020 22:19:48 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id l16sm1200762lji.123.2020.11.22.22.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:19:47 -0800 (PST)
Date:   Mon, 23 Nov 2020 08:19:41 +0200
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
Subject: [PATCH RESEND v6 0/4] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Initial support for ROHM BD9576MUF and BD9573MUF PMICs.

Resending in case it fell through the cracks :) Lee, any chance getting
this in MFD? (Also, this still lacks of your ack).

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
 drivers/watchdog/bd9576_wdt.c                 | 291 ++++++++++++++++++
 include/linux/mfd/rohm-bd957x.h               |  59 ++++
 include/linux/mfd/rohm-generic.h              |   2 +
 10 files changed, 613 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 drivers/watchdog/bd9576_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd957x.h


base-commit: 3cea11cd5e3b00d91caf0b4730194039b45c5891
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
