Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADACB275446
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Sep 2020 11:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgIWJV5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Sep 2020 05:21:57 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34986 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgIWJV4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Sep 2020 05:21:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id a15so16627496ljk.2;
        Wed, 23 Sep 2020 02:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=K/+FlzwEfC9DE2Ou4H87NcviiAaFeLbsoHSsi8TXT0o=;
        b=WJHdpHMnkb+aiV3J8Edtpp5aGlQwHb3xDgjPIkwWxoaGHP+RKyQLfGoZbZrVg4pF99
         YL5BqXpX6o3dIteItnCaW5WwiE+pHwGOhaFgY+CfV6RMRXNhJU3eVlFeRh+jd1gkOJcU
         Yxia3s2FOnBfPDa7Mno2YA2Z4kaqKP1+iDkg6lGBljIS8Yvvg0rSMagXL4PNuREl09n+
         /dhS57ptFq+QyOldz+AgB+RNIfNdxJ4Gq31uvnZQPf2kRtQaGXV6NJrO3mAAbseTwvOG
         TwJaeXJw7mA+5j8nYzhllDxGzGPvzdNNXhw5FTbGedHJi7hfcgAseCn1eboItWZ5BomB
         wpjA==
X-Gm-Message-State: AOAM531O5tLy4kuoAoAeqWBMsHHw4Cwn37z0EiTzdoZyqj8OFT12su89
        2L49H5cvH7+61VsoaWTuBjQ=
X-Google-Smtp-Source: ABdhPJxBhW7LZwpMiDnTUvVfVWPs06ohlAYCCU5FLZVtFMKxxu+bRGTOwn/+G+dNbGCqfB0iz9JACg==
X-Received: by 2002:a2e:b52c:: with SMTP id z12mr2682595ljm.437.1600852913571;
        Wed, 23 Sep 2020 02:21:53 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id f22sm4548442lfc.240.2020.09.23.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 02:21:52 -0700 (PDT)
Date:   Wed, 23 Sep 2020 12:21:41 +0300
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
Subject: [PATCH v2 0/4] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Initial support for ROHM BD9576MUF and BD9573MUF PMICs.

These PMICs are primarily intended to be used to power the R-Car family
processors. BD9576MUF includes some additional safety features the
BD9573MUF does not have. This initial version of drivers does not
utilize these features and for now the SW behaviour is identical.

Please note that this version of drivers is only tested on BD9576MUF
but according to the data-sheets the relevant parts of registers should
be same so drivers should also work on BD9573MUF.

This patch series includes MFD and watchdog drivers. Regulator part was
already applied.

- Enabling and pinging the watchdog
- configuring watchog timeout / window from device-tree

This patch series does not bring interrupt support. BD9576MUF and BD9573MUF
are designed to keep the IRQ line low for whole duration of error
condition. IRQ can't be 'acked'. So proper IRQ support would require
some IRQ limiter implementation (delayed unmask?) in order to not hog
the CPU.

Changelog v2:
  - dropped already applied regulator part
  - dt_bindings: Fixed case for regulator-names in the example
  - watchdog: unified probe error check and revised includes
  - mfd: removed extra linefeeds from header

---

Matti Vaittinen (4):
  dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF PMICs
  mfd: Support ROHM BD9576MUF and BD9573MUF
  wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
  MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers

 .../bindings/mfd/rohm,bd9576-pmic.yaml        | 129 ++++++++
 MAINTAINERS                                   |   4 +
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rohm-bd9576.c                     | 130 ++++++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd9576_wdt.c                 | 284 ++++++++++++++++++
 include/linux/mfd/rohm-bd957x.h               |  59 ++++
 include/linux/mfd/rohm-generic.h              |   2 +
 10 files changed, 634 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 drivers/watchdog/bd9576_wdt.c
 create mode 100644 include/linux/mfd/rohm-bd957x.h


base-commit: f4d51dffc6c01a9e94650d95ce0104964f8ae822
-- 
2.21.0


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
