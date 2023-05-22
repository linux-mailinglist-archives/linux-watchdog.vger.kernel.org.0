Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90E4870C0FA
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 May 2023 16:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjEVOYz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 May 2023 10:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234241AbjEVOYu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 May 2023 10:24:50 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786D3A3
        for <linux-watchdog@vger.kernel.org>; Mon, 22 May 2023 07:24:49 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-561bcd35117so76256467b3.3
        for <linux-watchdog@vger.kernel.org>; Mon, 22 May 2023 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684765488; x=1687357488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrJg/wNkBONGN0Wx1dEOSdok8QAk/Ae/CmqoO/cnmRg=;
        b=KfDZbj4bXwGaUp3a1Su4IZrFtYHv2dtXLahIW9sCcxP9YN0ThpZq8HEOpYzpclRob8
         hZS/s1cASzGh/Dmn55krIAiwAtGbd1wUC6UJY7LePypeU5bVuPokqQIyrcOrqElE4uow
         7Z/zbXq0TKy62Lnmmr0A5Ncpnrnkni6C1qiSeMb8ROQjmmkLQ1U+kXozgmJ9NvgVRccc
         rjl/zPsZ4SLnPKUqrLKFKqPEpXWt7jWazLooFH4UUQxdzrs7ajW6KxGgrFU3W1wB0KdU
         dmbzbpqcbDewfPM5VrF1u1R9Us8zKbvADTBCNbGeEDAq5nw98nfu4rEuIn92My3vljsX
         PZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684765488; x=1687357488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrJg/wNkBONGN0Wx1dEOSdok8QAk/Ae/CmqoO/cnmRg=;
        b=hyycyb5XilyH1XuO/ntW3WkeADxoDarADk4S6XAl3FTHcD7yFzR5WNaZ1eX9u9j2Nm
         mTwZaVjfbUwTwfZQnIDze25ecJ1JhGS8rV4iNOHStmRsigQdkiQXF0B8hUVUSVaMF/Lq
         7ssikr3HiBrDEwqFJxf1saevmgmXokvGfavzvG6QGwZob6Tq9onQxHiQBznT6XjtOqr5
         HicP3F9akc1wSC+aeA0hHshhy1xT7KPJOlZv7qbooTZtENqgadTB6xtVKlm5fdKsf0E4
         LazJl9ILigTSTM74Cm/AWaqUMjZovVD1dXBNbtaaAJhxAyN3MmwKTad0THNpbdtlSyk9
         RNLw==
X-Gm-Message-State: AC+VfDw/wCoyENHJeRhWd97zsC0wO4Vb7Gm2IWopRUYhBw2SXtCjDequ
        q3mLf3JgpB6XKSNzZA3TXygGzKJn8dgRiCvWZFOOuA==
X-Google-Smtp-Source: ACHHUZ691OZMM8jUjpb+3dxigP6SFjRM6SysuXo4etlxvNSPTofI3FdW6TA1O5XrhguCoPsbsO0RAEKa8KEvnldXcig=
X-Received: by 2002:a0d:df4c:0:b0:561:18c6:528c with SMTP id
 i73-20020a0ddf4c000000b0056118c6528cmr11601341ywe.30.1684765488684; Mon, 22
 May 2023 07:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
 <20230203-evk-board-support-v7-6-98cbdfac656e@baylibre.com> <ff7292f0-9055-1787-2543-e219fe30dddf@collabora.com>
In-Reply-To: <ff7292f0-9055-1787-2543-e219fe30dddf@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Mon, 22 May 2023 16:24:37 +0200
Message-ID: <CAFGrd9owtGmE7xPVRG7VwN5vrKtnq42q6ydSgex+Xocz-Oc16w@mail.gmail.com>
Subject: Re: [PATCH v7 06/11] arm64: dts: mediatek: set vmc regulator as
 always on
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Angelo

Le lun. 15 mai 2023 =C3=A0 13:44, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 11/05/23 18:29, amergnat@baylibre.com ha scritto:
> > From: Fabien Parent <fparent@baylibre.com>
> >
> > On downstream, we observe that the MSDC IP (used by the emmc, the micro
> > SD card and the WiFi) isn't working properly if the VMC regulator is
> > shutdown.
> >
> > Make sure it is always on.
>
> I don't understand the power tree of this board: if your VQMMC is VIO18 a=
nd
> *not* VMC, why is that required?

I don't have the full history of the downstream, but I think there is
a schematic
issue or HW conception issue because I see an extra pin "MSDC1_INSI" (which
isn't part of MSDC IP) with VIO18 pull-up. That's why, I guess, VQMMC =3D V=
IO18
for MMC1. But since DVDD28_MSDC1 =3D VMC, VQMMC should be equal
to VMC.

The always-on will be removed.

Regards,
Alexandre
