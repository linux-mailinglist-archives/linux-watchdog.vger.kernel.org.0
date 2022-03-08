Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37034D1CCB
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Mar 2022 17:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348159AbiCHQJX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Mar 2022 11:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348183AbiCHQJW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Mar 2022 11:09:22 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC484B843;
        Tue,  8 Mar 2022 08:08:20 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id z8so15976572oix.3;
        Tue, 08 Mar 2022 08:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fIYdhkRgnd5IrdDqw6cSIJSdZy8FeYm4lCYJZq5beHQ=;
        b=CZgim5qb5gtg0bs19bJ3reUh8fp/x0PbTPozpA0HSCWtLd8xFz3cuDiZXmfsjleFMJ
         +0rRnn/zcE8B7S5vYqiVow1DSMcsNTRVbPog8KMTnL85W56v798PZjysZcvImrAgSrzU
         pH9HS+xOHhmVFHaMmtTma2IWILt9ztMp7O2tBN+AW0OGLhF7ytjDhgjdPv9i9s4iAWNw
         FYzc6I6kXF8WKYbnLFmbANpQfApRTNHu58YMRJyByfftwyIruQzEXKglCSF+R8JOxtTu
         TE9BN8Cvl1U9ve4zYUGhUtO8H4zxEFAT3+jFYlQWComEDGxDugCJzkcj33m4vgmTqNmo
         BzRw==
X-Gm-Message-State: AOAM532jgigVIrEYWHjyAECE7NDxllel5HF0ML2C2SxoISc4RA7Y+CKQ
        kof3xXAI5hWDWynHpwJ1lQ==
X-Google-Smtp-Source: ABdhPJyIzxkFrakrSZDtNlGtYK1sQFfMMuwRA141r44tBdCLEzkLpuro9a8jdegDXPKy1BT7Ta7sDg==
X-Received: by 2002:a05:6808:148c:b0:2d9:a01a:4ba5 with SMTP id e12-20020a056808148c00b002d9a01a4ba5mr3090427oiw.204.1646755699624;
        Tue, 08 Mar 2022 08:08:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g18-20020a9d6c52000000b005af7c7cb702sm7555976otq.34.2022.03.08.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:08:18 -0800 (PST)
Received: (nullmailer pid 847079 invoked by uid 1000);
        Tue, 08 Mar 2022 16:08:17 -0000
Date:   Tue, 8 Mar 2022 10:08:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Maxime Ripard <mripard@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jesse Taube <mr.bossman075@gmail.com>,
        George Hilliard <thirtythreeforty@gmail.com>,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Mesih Kilinc <mesihkilinc@gmail.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 01/14] dt-bindings: watchdog: sunxi: fix F1C100s
 compatible
Message-ID: <Yid/cY2eWlHKp7YN@robh.at.kernel.org>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307143421.1106209-2-andre.przywara@arm.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 07 Mar 2022 14:34:08 +0000, Andre Przywara wrote:
> The F1C100 series actually features a newer generation watchdog IP, so
> the compatible string was wrong.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
