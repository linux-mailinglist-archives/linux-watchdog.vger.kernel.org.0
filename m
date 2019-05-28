Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25E972C02D
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2019 09:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfE1HiX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 May 2019 03:38:23 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41535 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfE1HiX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 May 2019 03:38:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id q16so8303856ljj.8;
        Tue, 28 May 2019 00:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mVDZ2sO2sqP5WMDwhimUTnT2H3QkF6r6ChuK7DfUixc=;
        b=ituWSajAt4SKnTYsbDRGlfDPeW4I+2KTSuCXl6Bk7VjKvFim/4Krrl82AxxI4eGAkz
         VeSRZe22O4kQBKnDL/a7eG6jvhquPCwKH7B3BqSaKSRPDCv2VDTaMfP+RbL69X5jE2NB
         tYz5jQlalwvlmwb89SHLbyRhb9PVTQmYusXlBBC81nPwk3kQsel13sKnDgcN3w2WGvvi
         xv+6ljjdjb/2XO7LhamTXVdKp6ufC0Ki4FB20ma/lrGXMHSRDKMJIc/sp1HFPW4w255j
         q8Uk74A7/CvyaBJTF07Sa3XstToPJo3bbf5530vM/Vd2hRwVfL4xeZo/Xs7ahKKG5gFx
         u1iQ==
X-Gm-Message-State: APjAAAXMXLz6y+j4FYPk4NmZpldeJ35gFX5gSoDUiiM4i6n9QC2x3iD1
        whvaMqLTF7Cjy1/7UPqu2y0Uy4Vmma1+mIwcvoI=
X-Google-Smtp-Source: APXvYqyN2Lo0a/qVm+JK77QAVe12CO7SdZMdxGmXB3bKf1lrdGvOh7u2/JOVMFUCqRh0c3k0oPpaEidOAmlIAK94Vx0=
X-Received: by 2002:a2e:960e:: with SMTP id v14mr12606553ljh.31.1559029100779;
 Tue, 28 May 2019 00:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <1558603778-20848-1-git-send-email-na-hoan@jinso.co.jp> <1558603778-20848-2-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1558603778-20848-2-git-send-email-na-hoan@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 May 2019 09:38:09 +0200
Message-ID: <CAMuHMdXMcu6+TOj7AZKe2gENjQH16q0J=P1pzGu6NUGwEMAx5Q@mail.gmail.com>
Subject: Re: [PATCH] watchdog: renesas_wdt: Use 'dev' instead of dereferencing
 it repeatedly
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 23, 2019 at 11:30 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> Add helper variable dev = &pdev->dev
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
