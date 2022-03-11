Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 029C04D5D3E
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Mar 2022 09:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiCKIZr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Mar 2022 03:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbiCKIZq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Mar 2022 03:25:46 -0500
X-Greylist: delayed 304 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Mar 2022 00:24:44 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076CB1B8FCE
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Mar 2022 00:24:43 -0800 (PST)
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M2w4S-1nRUZB0z4W-003JZk; Fri, 11 Mar 2022 09:19:37 +0100
Received: by mail-wr1-f52.google.com with SMTP id u1so11711576wrg.11;
        Fri, 11 Mar 2022 00:19:37 -0800 (PST)
X-Gm-Message-State: AOAM532rgpXhBShZrOQdXJ4Q6esGn7jjbOndTtDF0yRG1uR96PSmDKQH
        jJZyp4OOdqJ6yZmlqACUOaMF53SHjoAyeoMghuk=
X-Google-Smtp-Source: ABdhPJxWyOrVHPAd6W5M2rcxGMy+ZmZs2SFgKCrOVAaFDflfl6gItQqEvF+hSHJSQdSa0qDb39ePN/xMvFTNUGT9Yz4=
X-Received: by 2002:adf:f606:0:b0:203:8dff:f4ac with SMTP id
 t6-20020adff606000000b002038dfff4acmr4269722wrp.12.1646986776850; Fri, 11 Mar
 2022 00:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20220310195123.109359-1-nick.hawkins@hpe.com>
In-Reply-To: <20220310195123.109359-1-nick.hawkins@hpe.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 11 Mar 2022 09:19:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1z6bCfhMUzqjDNaNWky52vH+NjQA5Qpo=0tABv4Z1Ocw@mail.gmail.com>
Message-ID: <CAK8P3a1z6bCfhMUzqjDNaNWky52vH+NjQA5Qpo=0tABv4Z1Ocw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] ARM: Introduce HPE GXP Architecture
To:     "Hawkins, Nick" <nick.hawkins@hpe.com>
Cc:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ziDwfFtTkLuUoe0kpElF7+aylqnFrBKJHdKAQTnZAMeCZiJnoR7
 vBDunRWTaeqUZazAYYaVO9yFeHFIuRZviwmlZmt3l34REitNEqB0m22M3DIfwKweHQoxl7P
 xaWYVzknTn+576XmsQjEwHX/VrqfakLliWkK511V4sO+4WQXNCaIYPJiqJGkxa+4KQSMBGy
 xGe2im0WgMrpNhJ+ycOmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ejIZzQK4WX0=:p4Yc0vNAXMbnxRDhjWQ31v
 tP49zgKQqhgilNyDuK3/YctozYfdVVxZkqeYevhEKHhO2Zv0LeZ2qLRJEqUS+bXAUkOW/T+ZK
 qklwGcFt4CQRvRzTXvIHgQW2OH0jHMoZH87kOlbDo3QpCdo500fWcY0JZaid7TWkaDrSvVuF3
 gHFHHWribGvH1DYfFXcztux3zv4ieHffM0vz4ER8ACmYk+z0nD2H6yMZ87CIiDpmKeDLY65Kp
 8E6hwLE7pTXMK+jEhsxcb+UCc/UHMJvaVSguhWNGZ6ibUp5Yt/Poeg6anUAQiS6WnVvbe84hm
 5rrMX2RK2kVReU3AJ2EMjtkVXutIRMh3N7/N/auztgCyq422wN5nzkiwVFuCpzvTFffhphQ+V
 AmcBYSOuyuKi5XxLUOQjh4poGMpp9OEjBZ0KKPRvGfho6aVvedaYWQqoBcDrKfG/MRrYUO5i8
 TO0oTPmN2ZPvb0oEgq9y5R1xVlSyABMFUP3t+zkpkl8EK00pWFDvN86bQCQyL1iHg0qFAGp06
 3tuC2zC4Bnv6hiNPSzDskODhB9PiXtA/pzfIfkYouyDhwaLJMExpzlwhp4Sz4Y8FG6XdKYlvA
 1cBqFBba/d4bGfhdgtIQp7PW4MQIHGorg/nUz9VMkhSflxRlYR2dcb+VMemVpprmFgER2OFnQ
 MCpce1VBRB5l1zhuFITGVQZ9FO1b+Ock8BFqJP6+h2SMRsuTQwAgJrMLqaBozIomO+GCPPa+N
 LzZ7eYV6nlYssbbKCrSUsaIOFVnUrOgyWF/ixvVE7vvL9EajyBjNJnSsKG6hVrxdyMjKZ+Xhz
 +3hJyoxEh817i+ojcolrlil+Vrp3KnAXgrWmntzbjlTexmcW2qSWuUnu9NpAspJsEfyQT5dYf
 agT1WyQ68CA9lPgL0KSEzSyMPWblB9jbWNUQsxKLbSclTcH2nWGdBzVMlk3ACNPcVsH65INlh
 u4NZ/rco1eg==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 10, 2022 at 8:51 PM <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> Changes since v2:
>  *Reduced size of changes, put them into pathset format
>
> Changes since v1:
>  *Fix compiler warnings
>
> The GXP is the HPE BMC SoC that is used in the majority
> of HPE Generation 10 servers. Traditionally the asic will
> last multiple generations of server before being replaced.
>
> Info about SoC:
>
>   HPE GXP is the name of the HPE Soc. This SoC is used to implement
>   many BMC features at HPE. It supports ARMv7 architecture based on
>   the Cortex A9 core. It is capable of using an AXI bus to which
>   a memory controller is attached. It has multiple SPI interfaces
>   to connect boot flash and BIOS flash. It uses a 10/100/1000 MAC
>   for network connectivity. It has multiple i2c engines to drive
>   connectivity with a host infrastructure. The initial patches
>   enable the watchdog and timer enabling the host to be able to
>   boot.

This looks much better already, thanks for following the normal
submission procedures. With the timing for the merge window, this
is now too late for 5.18, but let's try to get it into 5.19 then.

       Arnd
