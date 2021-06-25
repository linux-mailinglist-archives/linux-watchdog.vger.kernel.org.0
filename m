Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6463B3BF4
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Jun 2021 07:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbhFYFNk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Jun 2021 01:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhFYFNk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Jun 2021 01:13:40 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E87C06175F
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Jun 2021 22:11:18 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id i12so8627539ila.13
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Jun 2021 22:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57iRP0TyZJaJvCo9zaWn65f6DCvfYNmLe//EEF6wtFI=;
        b=G6+6+qUtWHt/mqMvaRgc+Gqz00z1xMlxhpRYQaYaJeWU6yyTNZO7do743gVv4jHK7c
         Cf5fa4oH+l8dQtBujIa2tJFrQRypUsbuJ2g8w6/YNwhK2cvn75uo+BnD2640X3Jfvh+o
         wFfQo/c1oKk8n/1bkCxzeyTec06Fcim6K/v6kY42xxpa7N4xaoLzFD/9k8in9l1u6iTD
         O55APOWGyjaWFYwJ584SyR2fdNogeMoVGUqYZX0zNBFYopgk0bB5ZB+CItgZTzzguukZ
         /tesrwRM2nHhFov0bwkPo49Sx87WDir775v9FI0XrjZc4u5WWKqhO8YiqyaFfgqmthnl
         vbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57iRP0TyZJaJvCo9zaWn65f6DCvfYNmLe//EEF6wtFI=;
        b=nvfPsr5pKMzhuWw/L3rfcx9G/HYVT/FPGMZ6CsThqyBWvauLSpT5i06pMDQK6SUuvy
         z+MLt8nLie4djbHVWf+G2aeN9TsmaU43LTuM3MbObhJ/HZgR5XNL1Yha44dgs1CscXhd
         uNbIXNp7re+ADt8s+AtFA2OYUA80K7oXZAxAt3LID0hVtUxZWgtLveqN+tpLie1wG1Uh
         RFzgyyb3w3qpgFMgJ7RaevGsfwOTdkoyhdaTIQCPsLeIRKpUibEFpzjbb80fquzA9H51
         Zx7xPMbVlTu5pJu+3wNmnWxC2sqfwgI1AJWFXPaitZtBIZUl//1E4/9WreGLUjR5S933
         1cag==
X-Gm-Message-State: AOAM532BE+nzfaptkwsQl5YNW91+RLxvvO5JIzQTfFNymZzGUwZAVnlQ
        hEv1f9SLaun1m7UokU/6os6OOI4gNW5sfXWXhpMITA==
X-Google-Smtp-Source: ABdhPJwzLav6Dz0Iv39Al05WGPtRKLaG6fOQ1SvXRk6WVJyGlBBTuVK9ecDEQXceJq+eiH2V6GoNaWQum484UavOJCU=
X-Received: by 2002:a05:6e02:1064:: with SMTP id q4mr6269901ilj.127.1624597878160;
 Thu, 24 Jun 2021 22:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210623123854.21941-1-Christine.Zhu@mediatek.com> <20210623123854.21941-4-Christine.Zhu@mediatek.com>
In-Reply-To: <20210623123854.21941-4-Christine.Zhu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 25 Jun 2021 13:11:07 +0800
Message-ID: <CA+Px+wX7yBvuzj=KWf0MhLkTQOi4Rfn8F6z_+g-T66K3iMfb=w@mail.gmail.com>
Subject: Re: [v4,3/3] watchdog: mediatek: mt8195: add wdt support
To:     Christine Zhu <christine.zhu@mediatek.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        matthias.bgg@gmail.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        seiya.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 23, 2021 at 8:44 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
>
> Support MT8195 watchdog device.
>
> Signed-off-by: christine.zhu <Christine.Zhu@mediatek.com>
Still missed this part per suggestion in [1].

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20210623092917.4447-2-Christine.Zhu@mediatek.com/#24270619
