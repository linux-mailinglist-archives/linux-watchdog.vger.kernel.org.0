Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B8C4337B8
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Oct 2021 15:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235741AbhJSNug (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 19 Oct 2021 09:50:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235774AbhJSNuf (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 19 Oct 2021 09:50:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E70560724;
        Tue, 19 Oct 2021 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634651303;
        bh=XMC/wPCLR3CBhhlT5pdzczydUVy9/N9xDjzMYHJpisA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XVz3/x1A/lWTu+niZXy+0StJv8L0IQUVZCiEkvfOa2MSgPYviTFsMQRTwZ3RVMjAP
         DzH/cm9o/LLbuqUW6I9Le6IwMuAXwMhqLFqjhJCnSHqXs+ypzZZwxBLjSJ0Ll2E62x
         o8rufTm7qtEo9zHjmTQQ0NtwVzZht+5ULI1kM9DQVVME+xBOISQk10mcnTp6u7yxgj
         dyaV2siNXZ1TUw6pCpxOAdRhmEyo+7KjmHmTk/NR/46CZrXDS1YWGb4sj5ZH41yB2x
         kkUdq6HwbVs+sxWqgsUvVOCoP/4u8QqgRd0Vg0A3iNMFXv/claKAiPQpQTGq4xQDJM
         76mZsOYYP/Jpg==
Received: by mail-ed1-f46.google.com with SMTP id w19so13222362edd.2;
        Tue, 19 Oct 2021 06:48:23 -0700 (PDT)
X-Gm-Message-State: AOAM531Rx4oghoBppGP3mW3OpOcqtQD7QIqZB9WvXAEJmSIDQRvVkau4
        e6D+6hNG5xIcIAOyPFaq4jiTZIbXi0DTdavz8g==
X-Google-Smtp-Source: ABdhPJyAfrYlSPnzjG28JymfwvH0BP3fn74QUTfI0oe+sTUWy23ijNdMN4gs6ujRiJQN0RszPk5QghJDBRsUY0PgyKY=
X-Received: by 2002:a05:6402:1778:: with SMTP id da24mr53073940edb.318.1634651259310;
 Tue, 19 Oct 2021 06:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211018101608.3818840-1-tzungbi@google.com>
In-Reply-To: <20211018101608.3818840-1-tzungbi@google.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 19 Oct 2021 08:47:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK9UQ9K+GseF5QtiPW_sHMiupq1HAwDArN6P+H8iBwJ-Q@mail.gmail.com>
Message-ID: <CAL_JsqK9UQ9K+GseF5QtiPW_sHMiupq1HAwDArN6P+H8iBwJ-Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: rename reset controller
 headers in DT example
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Oct 18, 2021 at 5:16 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Commit f07c776f6d7e ("arm64: dts: mediatek: Move reset controller
> constants into common location") moves the reset controller headers.
> However, it forgot to rename the DT example in mt8192-afe-pcm.yaml.
>
> Renames the DT example to pass dt_binding_check.
>
> Fixes: f07c776f6d7e ("arm64: dts: mediatek: Move reset controller constants into common location")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> The patch bases on next-20211018.
>
> In Mark's tree[1], the commit f07c776f6d7e hasn't shown up.
> In Matthias's tree[2], mt8192-afe-pcm.yaml hasn't applied.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
>
> Also, I am not sure if the commit hash "f07c776f6d7e" would change
> or not after it applies to mainline.
>
>  Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Not great as things will break again in the merge window temporarily.
You could just not use the 1 reset define in the example and avoid all
that, but this is fine:

Acked-by: Rob Herring <robh@kernel.org>
