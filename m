Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A446B27F9
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Mar 2023 15:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbjCIOze (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 Mar 2023 09:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbjCIOy7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 Mar 2023 09:54:59 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C67FF4023
        for <linux-watchdog@vger.kernel.org>; Thu,  9 Mar 2023 06:51:56 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id bp19so1826004oib.4
        for <linux-watchdog@vger.kernel.org>; Thu, 09 Mar 2023 06:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678373516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gpqy2UwJbTsT8CSlsBkekwaizPbfI6waBJSct+QDKo8=;
        b=7VnZ8eoq8JCRR9LWSoq6SXSKIYIRedzcewZzSE9gKx6AQQB2Ax7dwKBcAYwJrjlsWs
         4TCezR69X8MwfD4+CKaz/SObaltdvIIieLVdJ+BWlplOPFiALrUJwDgjMU47Vf51qRDl
         xdFrwA1rnPNMA0GVzeDnkpXSGfyag6vAi04knNO8VIXj+D5n+705no78/qGHcnD2tLqc
         nohnomuGXgF8COo7QbluFk8QfItIs5fLy7I2ZnAC1v81iSP6Ds1uiOBx5oP32kgrJXPW
         yTtqYLrIVGryvFjGoykGRd0Kl8dTZeGhvhFDQoCSZrB7mIPyeb5SEOWrMbUnxfz7JmgZ
         oQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678373516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gpqy2UwJbTsT8CSlsBkekwaizPbfI6waBJSct+QDKo8=;
        b=8Ch06LIfgCTxwQUq64/zFUbAK8wx7BpJfBXZO9mOM4x5r2Z8khCNvcWx95pN/n+mAZ
         vuo91kRRGVwIUIjHL4xM92zW0hp0Tb9Eu6/G293pv4dm6CdvC5FtmNgsu2Wod89h8CgO
         PsWO8r1Cz7dDwFG6wYDxh1X8ikyeIpmT8vNtm7FbFlKZU+z/d4aFKi9udjRU8JXQY5lZ
         1pzkTacuILg7asaio2IRuNX2ziVaWtVNk2O6Gs2veoZ5aBXfauz7wBJSpFqyCDVev3gy
         8udV1ZcaNPLjMQVLcoDaq05/qO0O14rSk80Zgd+Gm0gj7Ye0BsOvTghALmoY6VDkkNpI
         eANQ==
X-Gm-Message-State: AO0yUKVy3vgoJbHJkeckB9GaLf+zR5WvgZm7ck8WuE+cUYw3A4Sk+C4j
        43egHqmy8W2ctHxBzExF3E5FMQoZS1Cpc/ae8uS/NA==
X-Google-Smtp-Source: AK7set8A8FpW9dqaR73G09blcvv/Ti7DIE1vGNLlncw0hLE8FnQCoXHRSlvX0YUqfVCqYXdazGxGSi3CnqOThNIO2y8=
X-Received: by 2002:a05:6808:2208:b0:37a:2bed:5756 with SMTP id
 bd8-20020a056808220800b0037a2bed5756mr12243997oib.0.1678373515531; Thu, 09
 Mar 2023 06:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-17-6ec7cdb10ccf@baylibre.com> <0fb37a8f-f284-76f2-e2f3-ff0f23eaa200@collabora.com>
In-Reply-To: <0fb37a8f-f284-76f2-e2f3-ff0f23eaa200@collabora.com>
From:   =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date:   Thu, 9 Mar 2023 15:51:44 +0100
Message-ID: <CAP2ifjOtORrGKEBMw-CzPR4B8CPDaRKnqKHyKL7mC_8qH08=iA@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] arm64: dts: mediatek: fix systimer properties
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Alexandre Mergnat <amergnat@baylibre.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
        devicetree@vger.kernel.org,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On Thu, Mar 9, 2023 at 2:32=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/03/23 14:17, Alexandre Mergnat ha scritto:
> > From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> >
> > MT8365 has a SYST timer (System Timer), therefore the compatible node
> > should be "mediatek,mt6765-timer" instead of "mediatek,mt6795-systimer"
> > (which corresponds to ARM/ARM64 System Timer).
>
> So this is not a CPUXGPT, not a GPT, but a SYST?
>
> At this point, this should not be even introduced because commit [1] is
> not in linux-next yet.
>
> [1]: https://lore.kernel.org/all/20230125143503.1015424-10-bero@baylibre.=
com/

I've posted a new revision of this patchset containing the systimer fix.

https://lore.kernel.org/linux-mediatek/20230309143459.401783-1-bero@baylibr=
e.com/

ttyl
bero
