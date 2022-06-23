Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746C5557E74
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jun 2022 17:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbiFWPKg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jun 2022 11:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiFWPKf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jun 2022 11:10:35 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F395326C2
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Jun 2022 08:10:32 -0700 (PDT)
Received: from mail-ot1-f43.google.com ([209.85.210.43]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYehP-1o9jm81Ig7-00VjzE for <linux-watchdog@vger.kernel.org>; Thu, 23 Jun
 2022 17:10:31 +0200
Received: by mail-ot1-f43.google.com with SMTP id l24-20020a0568301d7800b0060c1ebc6438so15550510oti.9
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Jun 2022 08:10:31 -0700 (PDT)
X-Gm-Message-State: AJIora90vm2uaSzeuwG+msISXhVELynRxwNAXEC2klCSIqAVP8xNsMOJ
        eu7SyGPcyrMf8JpEnf2XExerDDFtQ9v+tZjE+6g=
X-Google-Smtp-Source: AGRyM1vu2ZSkm/Pt+nGXc9raGKFWpG1R93fwwvTgqs7o3h5sgHq5bTE/W+B1nhlaeEKf3D0HrCeaA49AGPTGXH8OIc4=
X-Received: by 2002:a81:b93:0:b0:317:791f:3c0 with SMTP id 141-20020a810b93000000b00317791f03c0mr10368978ywl.42.1655993431168;
 Thu, 23 Jun 2022 07:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220622132302.267010-1-tmaimon77@gmail.com> <20220622132302.267010-3-tmaimon77@gmail.com>
In-Reply-To: <20220622132302.267010-3-tmaimon77@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jun 2022 16:10:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Q-NyfDYPurvK9FFbNn08bGvuxXpGSry5=kRsfu2BZbA@mail.gmail.com>
Message-ID: <CAK8P3a3Q-NyfDYPurvK9FFbNn08bGvuxXpGSry5=kRsfu2BZbA@mail.gmail.com>
Subject: Re: [PATCH v5 02/18] clocksource: timer-npcm7xx: Add NPCM845 timer support
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ItNeq9L0EuY39CyzT0uTYzUzWxB+KxUNhYFsy1Gq0YTL75BPOC3
 d//qSDA2QZXta39V8Wi5NBQ4GnD6a7nqREzcoujayzG1BlzmcjW2vJHPgD+/cBpxhQDf5WA
 cnyO5s9kYBI6dOZi1eUkc4h/te51SzL12vyzvUkzDpQrfc79MbEYZfdeG9j7p6NzvuvqFuL
 v88SllAIAf1HpNA9J1aVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q/AQY4kKoKU=:Ah+Z7W2ttO0B6vcKW3MK1L
 0QRIrpN5L8k2pHxdgq5sn43mkVHWumaXLUhF2c7429fr5BLtYLlKm8HBg5UgyqsRnAtfqgvHj
 bXIWArLobGo4OOQyBxEnjc7odMKedqkFgYibEnYJ5K5Hknwqf2ubI079A5de6tnwVhV/gk97R
 LLSM8LA0pY7IVVLpCPAFARj5YCeRyQHWgJ9qxj7T3eEJYkJWvpk+mpKosgWPwdLoVB9oiUcng
 hpjkEiJSj15uYSG/Prtpu5uYPUs6gjy98y+JxKTIHNTvl+G6s0Rij2y4QujxUftyyXd3P7mq1
 nCfvS8S0ww+FB6are2b4sHUoSyv/7ULSB/ykAyogoQ6ZO2Eooi33Q91xyk+XQ2w+DFwwjBxyI
 PjkFX/ePwai7tphiPYn58OK+5X9bxCpX3GDuvyV4wmTt3M1ZKgw3v6WDB/N7hJa3eHHb0tKY6
 eiE6Fv2fgQKNHh0lr6J83WzPXcUv2BDX768l66MfhEqwC/IxmR8jgERiua34/OSI9bRAT61gh
 Gc97nIZsJ5DszqBe9FIw8WEzHTssLt4KmRbOLkWbeeQI9rRD5TkDp0w0th+tkp3bYG8qFLZ+J
 L8lSIdBNUHcqPu8tS87NSbJmuw+OmQFqq6VvO2Gzs9gViI8FAPDx+4yiyvomN34vO22ctRKPX
 YmdWtfQT1yEN2ReBHVzW8a62YQFGv364+Kl9hMm6p+JfSatACTZEmmjP5uRGS3HzsDEuigShQ
 1+xg8NpibdbfpMUAXnO/GvDRoGCqiXvFAYTNN/RZZwlDUvdRIms+X/xXR2TKpccnhnlW4KeNL
 Bw7ZTQ9XfBK0kDsTYwBY8jpbSvxeW7uAnUgWiLvnfgAI7eG5njjSYpPr9Artmg4mavYSv88KR
 bERUzpIy+UnCyDZYYIBw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 22, 2022 at 3:22 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton BMC NPCM845 timer support, The NPCM845 uses the same timer
> controller as the NPCM750.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

I think I've commented on this before: if the timer is the same, you should not
need any changes to the timer driver, just mark the device node as compatible
with the older model (as well as its own string) in its "compatible"
property and
drop this patch.

        Arnd
