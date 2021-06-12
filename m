Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1345A3A4FDC
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Jun 2021 19:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhFLRKg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 12 Jun 2021 13:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbhFLRKf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 12 Jun 2021 13:10:35 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1F5C061767
        for <linux-watchdog@vger.kernel.org>; Sat, 12 Jun 2021 10:08:36 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id c18so19275205qkc.11
        for <linux-watchdog@vger.kernel.org>; Sat, 12 Jun 2021 10:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eF4uJPB1UaQG346iytYDyBpac2Jv1lo69omQv4FTdC4=;
        b=cHKQSVaqm+BdymJww/7MwVyuig7oIOR2OF87mHmkRq4Y0XMWHuVEodG1Rs3SEZojWG
         mT+D5tMfWxF3B846nUjegE0nfMz4RZIz/8FXvSt4YgR07l/JrUKThEY0zYqNEaamfcLK
         tEpeWZ2f0pvepQD1WLHvNjOX1MOSMUVRBEq0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eF4uJPB1UaQG346iytYDyBpac2Jv1lo69omQv4FTdC4=;
        b=tIViYy50ssaQo4cVxcb2yont4B6WBGGfBFxcFFyWKdaLw4amSORuRDA3To4xpG/Tpg
         JXlnJvZMUnMWpk+FusCGxLE2r3pzag2llj887xsds8q/JVX+VfNuydLyKhL2gEsKuyW4
         /XH3LGa2jI29Z+cj6qQjj4EdGXlt68LvdIUgy3Zk3fWsBcouO6V3YJ3DwaKOWE0+XzjC
         vzH8XuQ2w4Ovk98FhvcqpyQdUEadHUQFsXjByfxNfYOAaV1tSc1ZD6pXPIMTH1cdKtp5
         OGwDlqjhQODxoUy/bxxH97RVviNdTYrBGqc/1vXvdbvxNlbdsCxCpK6ubf1EqrE/1IK3
         IjLw==
X-Gm-Message-State: AOAM5322edwrvZxjNWCdTNOm9xcx421Zw6pi/Bu8mrsVYlCxHRk88xT7
        pv9QFAjvx0eFlDkcr1HJu/fRmwEx8b0vF25pJM+2vA==
X-Google-Smtp-Source: ABdhPJwFU4RBCkdvdeNBdtOCaz0q40IMdBvpCN+yhDZleT31VF0xTooIotPrY4HPtY77MZOBq2SudPXLZT60HVIbzr8=
X-Received: by 2002:a05:620a:a87:: with SMTP id v7mr9357572qkg.468.1623517715113;
 Sat, 12 Jun 2021 10:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210611200801.52139-1-romain.perier@gmail.com> <20210612125915.GA320112@roeck-us.net>
In-Reply-To: <20210612125915.GA320112@roeck-us.net>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sun, 13 Jun 2021 02:10:37 +0900
Message-ID: <CAFr9PX=j3UxbawtuvQnyoToH=3iT_k+j_LByUF-uDd0yDOk2ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add watchdog for Mstar SoCs
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Romain Perier <romain.perier@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter, Romain,

On Sat, 12 Jun 2021 at 21:59, Guenter Roeck <linux@roeck-us.net> wrote:
> This works better. I applied patches 1 & 2 to my watchdog-next branch for
> hand-off to Wim. Note that the arm dts patch needs to be pushed through the
> arm tree.

I will take the dts patch and send a PR with it to the arm tree.

Cheers,

Daniel
