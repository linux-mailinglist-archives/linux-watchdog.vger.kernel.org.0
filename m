Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9AB3D659E
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 19:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235753AbhGZQoW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 12:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240598AbhGZQoL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 12:44:11 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13F5C061D74;
        Mon, 26 Jul 2021 10:00:02 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so921216pji.5;
        Mon, 26 Jul 2021 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JXUZz3hZeoCPSsyXIn/aU117yRIRTjG03n6CdjN5gdc=;
        b=CcHZQDN8ByOvS1HE5DGMzQIPzco9Y9Qv/VBBIXLsyxdNzMQjkbeiPPvaHyJZ8LYIx7
         mIoC8rKc+4SIdOxxng4fXbVhBywIIJKmOHa0JT1GQyxZAotz5U7Mq3McNUnlt3v7eAMb
         yWeE8Ok7MCckIzr0C3oz9LJVMy0pXy18cw/tFV1hHc17iUTdmMfAmpvSNXewVWgbr6bH
         BXHIH1FfZiZhSUM0F8yXDEFXilr6VkV9CxA8bshRyWlXCh4V6ES6fues8BLeLfaLYtqX
         BOkhPoHVbxNUt/2I1tc7lNoPyKrJxskxf/Qy6FQPXT8Kc/ai3L4+XonQVZOaajxiOlot
         VpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JXUZz3hZeoCPSsyXIn/aU117yRIRTjG03n6CdjN5gdc=;
        b=ZfW3aa/v7dKHVcZPe4Hijr/DBD8P7636zSjecIk03RLSrFT/2IwuuEPVJSk3g8mhHI
         dYZyp+2jxPHysjC1KJU3TGqlTQwXATZ5UWl285jz2H6yvr2MV9dvw6dvXKg062dMvYcF
         nMBuKpaYrANfF3nPrstQ+soD6BEoIuXigaL0sJBfvOUAbdg8KDXKlnP16W92cFbZBJe3
         yPHHck4o0QouM7CurR1Sq1w98m9yQuTadaaxZ5o/6vqEqW98eJnXg523kxX+iklCGrXT
         lOxWKgmakfuDQy2F3NgscGDMvkQhEAiZ/PwFqayOtLzYxOAMa6v11EkD6n325XGDXM0R
         xBTg==
X-Gm-Message-State: AOAM530DiRWy7Jk8wX4p1Sw9IGvzKRfyxYP/hQ+ezq9Qmk4yYN3NCeDu
        LZjJoiqsavIFaM44twM+dXf1EWrStWg8+RX3i9g=
X-Google-Smtp-Source: ABdhPJxPgwguyDjwaq4hSyrhHpOTsIsXdB/uFSF+sRjlBZJ9R/CmHuZ9Kp/HIYYpGDQZAGxREv1W4nB+wannKq5ZI64=
X-Received: by 2002:a65:6895:: with SMTP id e21mr18755941pgt.426.1627318802372;
 Mon, 26 Jul 2021 10:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
In-Reply-To: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
From:   =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date:   Mon, 26 Jul 2021 19:59:51 +0300
Message-ID: <CAPWNY8Uf39v2g8Ln9b917sVPid2ruW86Oc64DwXod9oxgFAzhQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 26, 2021 at 2:46 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> Obviously, the test needs to run against the register content, not its
> address.
>
> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second=
 timeout")
> Reported-by: Mantas Mikul=C4=97nas <grawity@gmail.com>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  drivers/watchdog/iTCO_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index b3f604669e2c..643c6c2d0b72 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -362,7 +362,7 @@ static int iTCO_wdt_set_timeout(struct watchdog_devic=
e *wd_dev, unsigned int t)
>          * Otherwise, the BIOS generally reboots when the SMI triggers.
>          */
>         if (p->smi_res &&
> -           (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) !=3D (TCO_EN | GBL_SMI_EN=
))
> +           (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) !=3D (TCO_EN | GBL_S=
MI_EN))
>                 tmrval /=3D 2;
>
>         /* from the specs: */
> --
> 2.26.2

Tested-by: Mantas Mikul=C4=97nas <grawity@gmail.com>

--=20
Mantas Mikul=C4=97nas
