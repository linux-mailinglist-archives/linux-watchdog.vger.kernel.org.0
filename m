Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72357E2F48
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 22:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbjKFVxX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 16:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233204AbjKFVxW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 16:53:22 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4BBD7F
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 13:53:19 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5431614d90eso8268067a12.1
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 13:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699307596; x=1699912396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNAdiaf7CFJFGR+XgzzaLNcE9ebdwuse14Opfb1nM5c=;
        b=JXkEYDEugqKvyhezruwgFaSx7gSW2M+7AAC6hKFcPA1SvASIWqYrjpnB9sIoQTSdyM
         xP+hR+45THPwDfmnPguSlSHOGmhq4q/Ob4AgcsL8S9SWxEBfpd7RXU+Ey4BTAWYQ2f9W
         AwNG9Qzhpt+0XSxgKGgdJTvuJ0rXKjoN4xXIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699307596; x=1699912396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNAdiaf7CFJFGR+XgzzaLNcE9ebdwuse14Opfb1nM5c=;
        b=NiHt+Q12+Y3jEB4i941n4gGvJ0BdZO6pWtK4UKK8RWmAZFsjM/fX+x39QRlwDMgA94
         6hxxYPEDDjlw+kgSsKaYHiZjloswJI79M7/4HB8wRtl5UH7epOPPIZ+OLHdHvbAiC4Ib
         L9Vse+uh64LyEBQVRYMujDm6lurqMMLDYacK3s5bHG3zLYYBBjVE1L2PdzrehvU0+rfm
         5sfzG5N2aWzSbBAZol91tP6P4G1hZwdP8aNXEVqrlgpfE6Xnb6pbQUN1kmDRS9p14Do9
         jMiYxPUgWM3ObQ5eSGi3BgaSAm+SDrogI8XK2pssS+eyuauo5YhZRuADcn78G6oidGlB
         fGRw==
X-Gm-Message-State: AOJu0Yzau8t2qKZ85Se+FmsS9kmqJvytyU7g6cc1CGxR6G5QPfy2bTZF
        FEBqjrB5U/zJvQWWrcWzyQcm4y8whKEumKTq5oiCnJ3K
X-Google-Smtp-Source: AGHT+IFUWIAvhj3kA3v0FipjV3QJQSalKIYUynpN1xpU1WmpRQ6ZJPxY+id0oiFTuvkIFYEnCFzZXw==
X-Received: by 2002:a17:907:268a:b0:9e0:4910:1651 with SMTP id bn10-20020a170907268a00b009e049101651mr3364781ejc.41.1699307596061;
        Mon, 06 Nov 2023 13:53:16 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id n21-20020a170906089500b00997e99a662bsm293038eje.20.2023.11.06.13.53.15
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 13:53:15 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40853f2e93eso26155e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 13:53:15 -0800 (PST)
X-Received: by 2002:a05:600c:a005:b0:408:3727:92c5 with SMTP id
 jg5-20020a05600ca00500b00408372792c5mr40609wmb.2.1699307595154; Mon, 06 Nov
 2023 13:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <CAE-0n50vtad5hkkAuV-hvsnm+tTevd_4OSr3iGofBa5L8A0RQw@mail.gmail.com>
In-Reply-To: <CAE-0n50vtad5hkkAuV-hvsnm+tTevd_4OSr3iGofBa5L8A0RQw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 13:52:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UJE6VKrjFJ2g=4qRHLdnqymossWSAFeKyUykxm1sTCtQ@mail.gmail.com>
Message-ID: <CAD=FV=UJE6VKrjFJ2g=4qRHLdnqymossWSAFeKyUykxm1sTCtQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: qcom: sc7180: Make watchdog bark
 interrupt edge triggered
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Gross <agross@kernel.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Kees Cook <keescook@chromium.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Tony Luck <tony.luck@intel.com>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On Mon, Nov 6, 2023 at 1:49=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> w=
rote:
>
> Quoting Douglas Anderson (2023-11-03 16:34:27)
> > On sc7180 when the watchdog timer fires your logs get filled with:
> >   watchdog0: pretimeout event
> >   watchdog0: pretimeout event
> >   watchdog0: pretimeout event
> >   ...
> >   watchdog0: pretimeout event
> >
> > If you're using console-ramoops to debug crashes the above gets quite
> > annoying since it blows away any other log messages that might have
> > been there.
> >
> > The issue is that the "bark" interrupt (AKA the "pretimeout"
> > interrupt) remains high until the watchdog is pet. Since we've got
> > things configured as "level" triggered we'll keep getting interrupted
> > over and over.
> >
> > Let's switch to edge triggered. Now we'll get one interrupt when the
> > "bark" interrupt goes off we'll get one interrupt and won't get
>
> "We'll get one" twice?

I like to make like to make typos. If you hadn't hadn't noticed.

I'll wait another few days and send a version with the typo fixed
unless Bjorn tells me not to (because he didn't care and applied it
anyway or because he fixed it himself while applying).


> > another one until the "bark" interrupt is cleared and asserts again.
> >
> > This matches how many older Qualcomm SoCs have things configured.
> >
> > Fixes: 28cc13e4060c ("arm64: dts: qcom: sc7180: Add watchdog bark inter=
rupt")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks!

-Doug
