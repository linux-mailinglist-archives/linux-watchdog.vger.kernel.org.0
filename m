Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C77E32DCBC
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 23:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhCDWMw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 17:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbhCDWMv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 17:12:51 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F87C061756
        for <linux-watchdog@vger.kernel.org>; Thu,  4 Mar 2021 14:12:51 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id w17so4568730ejc.6
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Mar 2021 14:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uVV/5lGgGwVoyFOLAdPK3mAZTTVkR2SgKcDQqmfi5f0=;
        b=d6eQx8gQ4lAf/nIR6K9Z1w1AR6tECcgQbDMHIM0DKJnp0b/cZyKkmpgU1qKwvxC+Ca
         L6NGDTaBjBZ1+wNUOUnYRcrCVoPWiU146bdQjrCd6xliDWN1hjGOMAuXHhF7fMGzMM4B
         oGjrKIox9PScpCqRaE6VCrEHh4JtwF+K/pFis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uVV/5lGgGwVoyFOLAdPK3mAZTTVkR2SgKcDQqmfi5f0=;
        b=jTAXYron+jMo7AknBrFbc6tKyM+Tmdb+zx8aIODZgTP8FaOxFNly41emPlh/fZU809
         pSk57DNl2T2RfyElPZhIHeK4YanwbsYlJwVPpoTn+LWRXnJLT7hFfLGmT7c8+0Aqrd7e
         oMgZsND9otz5op8RY0mU0VTAVcshunvicMiGHDi+pq6BjamH9sOBdEqgUOZDeK5l0bei
         hbvIVD5ty2ut25TV157kr7VQfvNgcZg1g/4jdLz2FpunRxDTHvUKwdG8eLOTq9s+oqKT
         ijIgP7HAWaY/dU/wghYeRdqnpOaSp8zxqhYd2xymBrio3zsPi0FA6q1xcnR3zlBr4V/W
         q7Vw==
X-Gm-Message-State: AOAM531Je1Fhkc/6w8cQ5srGu4QFRxf/YsHhMveXfepAsw3KfGeYAPGm
        7gyRzji4Nla6vFMISo6HNo4+VA==
X-Google-Smtp-Source: ABdhPJwiESwMPtAfz3YFxc1xkgUfgpYGdvxzTe7pMrbVH8PkUSyTPv7/tTB6Mnqx/O4zqtQ49S2OSg==
X-Received: by 2002:a17:906:3b99:: with SMTP id u25mr6481602ejf.277.1614895970165;
        Thu, 04 Mar 2021 14:12:50 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id q22sm362099ejy.5.2021.03.04.14.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 14:12:49 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 0/3] add "delay" clock support to gpio_wdt
Date:   Thu,  4 Mar 2021 23:12:44 +0100
Message-Id: <20210304221247.488173-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

As Arnd and Guenther suggested, this adds support to the gpio_wdt
driver for being a consumer of the clock driving the ripple
counter. However, I don't think it should be merged as-is, see below.

The first patch makes sense on its own, quick grepping suggests plenty
of places that could benefit from this, and I thought it would be odd
to have to re-introduce a .remove callback in the gpio_wdt driver.

Unfortunately, this turns out to be a bit of an "operation succeeded,
patient (almost) died": We use CONFIG_GPIO_WATCHDOG_ARCH_INITCALL
because the watchdog has a rather short timeout (1.0-2.25s, 1.6s
typical according to data sheet). At first, I put the new code right
after the devm_gpiod_get(), but the problem is that this early, we get
-EPROBE_DEFER since the clock provider (the RTC which sits off i2c)
isn't probed yet. But then the board would reset because it takes way
too long for the rest of the machine to initialize. [The bootloader
makes sure to turn on the RTC's clock output so the watchdog is
actually functional, the task here is to figure out the proper way to
prevent clk_disable_unused() from disabling it.]

Moving the logic to after the first "is it always-running and if so
give it an initial ping" made the board survive, but unfortunately the
second, and succesful, probe happens a little more than a second
later, which happens to work on this particular board, but is
obviously not suitable for production given that it's already above
what the spec says, and other random changes in the future might make
the gap even wider.

So I don't know. The hardware is obviously misdesigned, and I don't
know how far the mainline kernel should stretch to support this; OTOH
the kernel does contain lots of workarounds for quirks and hardware
bugs. 




Rasmus Villemoes (3):
  clk: add devm_clk_prepare_enable() helper
  dt-bindings: watchdog: add optional "delay" clock to gpio-wdt binding
  watchdog: gpio_wdt: implement support for optional "delay" clock

 .../devicetree/bindings/watchdog/gpio-wdt.txt |  6 ++++
 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/clk/clk-devres.c                      | 29 +++++++++++++++++++
 drivers/watchdog/gpio_wdt.c                   |  9 ++++++
 include/linux/clk.h                           | 13 +++++++++
 5 files changed, 58 insertions(+)

-- 
2.29.2

