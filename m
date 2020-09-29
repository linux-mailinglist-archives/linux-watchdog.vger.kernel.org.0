Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB0127BEF3
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Sep 2020 10:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbgI2IOT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Sep 2020 04:14:19 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41588 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI2IOT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Sep 2020 04:14:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id y4so3238804ljk.8;
        Tue, 29 Sep 2020 01:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=lJ0udYKkVONmAvzXZ5w1sc6h3Mnsltml1S9gpyJpMs8=;
        b=EkWgJ5EN4hc9X6ylmrg3IEjAgBREz3mgW1ZIUXdcCdGToUxjTmJQhq1EVG7bn0Xnw5
         rhnYl72Shx4V7pjlR99IvOxmsfBSn5yxB+Gzqw654uSgr11h2xU4yly9Ig6kVBI8TAEx
         YYObvc0WmTdsf1VomRV+1bYLE0OumENBzmpl0Cqz1pING6ebhfN/jtIK1wJOqlegIYit
         1/Z4M39zKAC72L5sSeZ7e1RxaKLfsHHqCzKK06t6GGuk86rznz3GnLbm03DHX4TKJlXe
         CbxZ+LeajYxfIiE8xrW3EIjz6KU/3HijXAlZBOPZmxPHj45mWui+6qwGqa9cPeFAfKJs
         Jkzw==
X-Gm-Message-State: AOAM533bXxTtqr+6EuAADsOBIBZrdVHddDBr1qJ6TRt6B0ihAJbXmJcp
        hzJeX4JuuYqH9nhuZijiemI=
X-Google-Smtp-Source: ABdhPJzunNQuzEeCQHxIt7tuWczSWtLEb3ASnY/whZh/nDFuW7yaXVgS3tQiIzmLsha5XwYY6prWHw==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr787602ljj.268.1601367255889;
        Tue, 29 Sep 2020 01:14:15 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 21sm3182751lfg.263.2020.09.29.01.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 01:14:15 -0700 (PDT)
Date:   Tue, 29 Sep 2020 11:14:03 +0300
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
Subject: [PATCH v3 0/4] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1601366711.git.matti.vaittinen@fi.rohmeurope.com>
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
