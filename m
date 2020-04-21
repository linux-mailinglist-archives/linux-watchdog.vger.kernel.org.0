Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44E21B29DA
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Apr 2020 16:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgDUOcz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Apr 2020 10:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729148AbgDUOcy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Apr 2020 10:32:54 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986CCC061A10;
        Tue, 21 Apr 2020 07:32:54 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a7so1427877pju.2;
        Tue, 21 Apr 2020 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VhdPVlsejti0R/bVX2Dz3DNDh0/fSSKk6j7NMkO5irM=;
        b=a1PI31epHy/zPaGm6qcUPgeq540XPegYAFciukS78tvdA50F5qEHuxp8kXoX3/77X1
         iPTZLrw6nSYSYrhTifp6rnvwLjynOeiAiA0h0TUwERfDpnMm3FHGOqUUMPKagaG8twO8
         vqdxI60S7SvRg2wW2tlJZl95pJAImd2n0UcO2KNt5mcxV9g8C1haFWkxaGCbnetu44My
         tX248TjNHPQF0lH2jnbTkIsTE+hvOR897QEIygvDOymnXolxtlVDoyuqVBpQcy74oNYN
         93/ZLn7Q2nbvxhvRtzRa7NU7+RG3pHBXnGXqyAuBcy4BVkQ0fR5OMlOagaSReXeEwLD6
         tXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VhdPVlsejti0R/bVX2Dz3DNDh0/fSSKk6j7NMkO5irM=;
        b=Ep80PjNN4qtla4+Eq/jL35WgWwpizESuaKjxWHTPYAgs1T4kDHLbn8eeef6143MYXp
         odvnPdq+nKWJMEfhvVh/7U8RMorW7XvzEEyoGtzCT6sTOY+CFBZMGRov0Euhdr/3UfwG
         BfyfXyJnMW4e9/Z7bEj9Tp5pYUXBF85cwKtxlk1rTgJdDeLFxZlcfxfv87IWG852R5FE
         v6vNAUmhOURYMhcn+oisBJtscMZVr12sMsVycJmoSlCRpgqdU773OMj+j1rc77fuoYdj
         MU0dIEi/Piz6/ISR8w5NHGNXQiegK/XrHy9HJD6oSZyx63YRhcY1CXLFHYAavSVo8KAa
         uwXQ==
X-Gm-Message-State: AGi0PuZKTS8Hq9rHo6YsK8RF8qIV7WHGlzbIjSnFik6jYBdIWi+xt0eX
        E5QtJk/oQd/JiK+lcYu90DTw/eeA
X-Google-Smtp-Source: APiQypIwprasvCm57gZ87iT+9Bjqhcf/WPTHumz3mJZrTYTv9S3r483yX8+BLlaMU+yEAROpa9KBgA==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id d12mr5920126pjw.158.1587479573887;
        Tue, 21 Apr 2020 07:32:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c144sm2610044pfb.172.2020.04.21.07.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 07:32:53 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
To:     Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     xingyu.chen@amlogic.com, jwerner@chromium.org,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20200421110520.197930-1-evanbenn@chromium.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e81737bc-9461-0fdb-245f-d88bdde8f0ee@roeck-us.net>
Date:   Tue, 21 Apr 2020 07:32:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421110520.197930-1-evanbenn@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/21/20 4:05 AM, Evan Benn wrote:
> This is currently supported in firmware deployed on oak, hana and elm mt8173
> chromebook devices. The kernel driver is written to be a generic SMC
> watchdog driver.
> 
> Arm Trusted Firmware upstreaming review:
>     https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405
> 
> Patch to add oak, hana, elm device tree:
>     https://lore.kernel.org/linux-arm-kernel/20200110073730.213789-1-hsinyi@chromium.org/
> I would like to add the device tree support after the above patch is
> accepted.
> 
> Changes in v4:
> - Add arm,smc-id property
> - Get smc-id from of property
> - Return a1 instead of a0 in timeleft
> 
Subject says v2. This is confusing, at the very least.

Guenter

> Changes in v3:
> - Change name back to arm
> - Add optional get_timeleft op
> - change name to arm_smc_wdt
> 
> Changes in v2:
> - Change name arm > mt8173
> - use watchdog_stop_on_reboot
> - use watchdog_stop_on_unregister
> - use devm_watchdog_register_device
> - remove smcwd_shutdown, smcwd_remove
> - change error codes
> 
> Evan Benn (1):
>   dt-bindings: watchdog: Add ARM smc wdt for mt8173 watchdog
> 
> Julius Werner (1):
>   watchdog: Add new arm_smc_wdt watchdog driver
> 
>  .../bindings/watchdog/arm-smc-wdt.yaml        |  36 ++++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/watchdog/Kconfig                      |  13 ++
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/arm_smc_wdt.c                | 194 ++++++++++++++++++
>  6 files changed, 252 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
>  create mode 100644 drivers/watchdog/arm_smc_wdt.c
> 

