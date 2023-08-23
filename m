Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 081E8785BDE
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Aug 2023 17:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237048AbjHWPTm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Aug 2023 11:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234729AbjHWPTl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Aug 2023 11:19:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFD810F8
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Aug 2023 08:19:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 232AA66473
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Aug 2023 15:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA3CC433C8;
        Wed, 23 Aug 2023 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692803934;
        bh=1HhWgxgZ/OdvFcrLfSrPMjddPyrrJ+HBdSpwrFuf2NE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LytZAiuAivXLxyA3Cn6Qnvsp8H5wfxUNXLzsaGnvi2zRKoLLu2foo0Ho/J4NHvdnP
         N+hzTaLQEV8Llp2d4P8BRzgnfBErBQyVDszFmtQdgZOk9w0zPHKpQ4FS2HxqeSh60B
         MYi8jv8SgRo82IDiWw69ZmbCH0wzTp0kGsco/XPb164OcLzmnO5XxPoB+BdC/5/NHw
         nIoWO+Oz70rBgy9vDQh4byb5HhaLsume7UD3l29r+plpyxzW8PDxkzeKNk5RoJKGM+
         1jso12T48XMhH4dI3CUibNkX+Z5Y4s7zoEW7qryWaaAH2FxAxcUWj1v6zHG18D2VFG
         QzRQ3xyGQRaSg==
Received: (nullmailer pid 2364874 invoked by uid 1000);
        Wed, 23 Aug 2023 15:18:51 -0000
Date:   Wed, 23 Aug 2023 10:18:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     srinivas.neeli@amd.com, wim@linux-watchdog.org,
        shubhrajyoti.datta@amd.com, michal.simek@amd.com,
        linux@roeck-us.net, ndesaulniers@google.com, trix@redhat.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, patches@lists.linux.dev,
        llvm@lists.linux.dev
Subject: Re: [PATCH] watchdog: xilinx_wwdt: Use div_u64() in
 xilinx_wwdt_start()
Message-ID: <20230823151851.GA2359738-robh@kernel.org>
References: <20230815-watchdog-xilinx-div_u64-v1-1-20b0b5a65c2e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815-watchdog-xilinx-div_u64-v1-1-20b0b5a65c2e@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 15, 2023 at 12:06:50PM -0700, Nathan Chancellor wrote:
> After commit f1a43aadb5a6 ("watchdog: Enable COMPILE_TEST for more
> drivers"), it is possible to enable this driver on 32-bit architectures.
> When building for those architectures with clang, there is an error due
> to a 64-bit division in xilinx_wwdt_start():
> 
>   ERROR: modpost: "__aeabi_uldivmod" [drivers/watchdog/xilinx_wwdt.ko] undefined!
> 
> Use div_u64() to fix this, which takes a 64-bit dividend and 32-bit
> divisor. GCC likely avoids the same error due to optimizations it
> employs to transform division by a constant into other equivalent
> operations, which may be different than what is implemented in clang.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1915
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/watchdog/xilinx_wwdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks for the fix. Also reported by 0-day with a similar failure:

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/watchdog/xilinx_wwdt.o: in function `xilinx_wwdt_start':
>> drivers/watchdog/xilinx_wwdt.c:74: undefined reference to `__udivdi3'


Acked-by: Rob Herring <robh@kernel.org>
