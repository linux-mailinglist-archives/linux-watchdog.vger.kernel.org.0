Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF0726D609
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Sep 2020 10:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgIQICL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Sep 2020 04:02:11 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42653 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgIQIBp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Sep 2020 04:01:45 -0400
Received: by mail-lj1-f196.google.com with SMTP id k25so1188917ljg.9;
        Thu, 17 Sep 2020 01:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=keP0zGyPB/h0gT6DXrHCTVCk7Uuvvtj1dSD5Jl+0+N0=;
        b=F6+LE53zPxKw9QWvfldBWUywHIZ9ZrD/f5tCI3QKAk5CUA9LhQFeGcCkz4AtDNY+Yh
         egEmZa56AdX+TmhCOR2UbSxi0BFXsrR1fXZETvnVwQotRPi39tFyhBk4lyfxnx+FWEYR
         phxapkLW3GGi7KDXhTlrW1W786LVd0se17LZ5Bxin0UkMI4N/9KiOo3CaCqkVH4OgZlW
         tBNVgc2z1XkpN9wf3EJtUD74IveA0MHCe/LUBHf3L8lxaeMb4uJe93W1wDEcaOZNjGPj
         Pt4xi0LAhk1Irs+wTq7miaV9zg/kwqcukwUUVfl+q30NPhM3NP7cSftijQ0J/RFFo0S0
         o43g==
X-Gm-Message-State: AOAM530+Uh8h2Hu1+qeuqfoT4/yy2zRT9ODwtuYnRbubBMnW6l3wa1Sq
        hWJJFMt3MEYGDzHp6MwrZ3Y=
X-Google-Smtp-Source: ABdhPJyHEOnNIjjQS5xiARJQyMZoabABxUOGIlLqJvGTDlk5JEi4O9myrdmeoyrb3/EjDLQf1QvS4w==
X-Received: by 2002:a2e:91cd:: with SMTP id u13mr8786118ljg.421.1600329698968;
        Thu, 17 Sep 2020 01:01:38 -0700 (PDT)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id b72sm5001856lfd.299.2020.09.17.01.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:01:35 -0700 (PDT)
Date:   Thu, 17 Sep 2020 11:01:27 +0300
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
Subject: [PATCH v1 0/6] Support ROHM BD9576MUF and BD9573MUF PMICs
Message-ID: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
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

This patch series includes MFD, watchdog and regulator drivers with
basic functionality such as:

- Enabling and pinging the watchdog
- configuring watchog timeout / window from device-tree
- reading regulator states/voltages
- enabling/disabling VOUT1 (VD50) when control mode B is used.

This patch series does not bring interrupt support. BD9576MUF and BD9573MUF
are designed to keep the IRQ line low for whole duration of error
condition. IRQ can't be 'acked'. So proper IRQ support would require
some IRQ limiter implementation (delayed unmask?) in order to not hog
the CPU.

---


Matti Vaittinen (6):
  dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF PMICs
  dt_bindings: regulator: Add ROHM BD9576MUF and BD9573MUF PMICs
  mfd: Support ROHM BD9576MUF and BD9573MUF
  wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
  regulator: Support ROHM BD9576MUF and BD9573MUF
  MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers

 .../bindings/mfd/rohm,bd9576-pmic.yaml        | 129 +++++++
 .../regulator/rohm,bd9576-regulator.yaml      |  33 ++
 MAINTAINERS                                   |   4 +
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rohm-bd9576.c                     | 130 +++++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/bd9576-regulator.c          | 337 ++++++++++++++++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/bd9576_wdt.c                 | 295 +++++++++++++++
 include/linux/mfd/rohm-bd957x.h               |  61 ++++
 include/linux/mfd/rohm-generic.h              |   2 +
 14 files changed, 1028 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 drivers/regulator/bd9576-regulator.c
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
