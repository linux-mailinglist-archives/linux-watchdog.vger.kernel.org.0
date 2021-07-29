Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0543DAF4A
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 00:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhG2Wkh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 18:40:37 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:41484 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbhG2Wkg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 18:40:36 -0400
Received: by mail-io1-f44.google.com with SMTP id r6so795601ioj.8;
        Thu, 29 Jul 2021 15:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OOVxBMpDeZKCsvDZDpFIKnIYayW56aUyxJ0XJKMxJhU=;
        b=hlEdJd9/4d9AiUhcxK/54tdENuYujgHDjiJkKSbPESKaF+ZusY9HTuWUo5JwKPgn/a
         gG+54ZJdenBHvS3Tc+t8OG4lxLicM3XosaYWmWr5aITuMXXxh3evFEPsRBjoiWx1zeYY
         KvM7/EhtIGW4QIV9TzBXq6NA8YGPudLaMU+PMX8Lo0H7vWvIjjgZ/it4Sb1WVs4IZHan
         xVcxI3A76iy8j/6XWwQUybbJkR5RpVBLdtXl0Z0SB4HpYi1yADJ9MeVX9j+Eqx41BEyM
         RCVWcaQffNACf6wB6CxBrrgYuJjD2R6gDdic3/QiKFS3tE8W1ZrhPvZkFHs/R9C51HcL
         uWTg==
X-Gm-Message-State: AOAM53317rHhkPhLflbQYk84MWbXiOJBY53DkHdaE/K2GS+w7WOWONEg
        TeyrT2AR9LhOFnS8Zj0XfQ==
X-Google-Smtp-Source: ABdhPJzuX7wUe8c+G+oaFJdjEtuWCGo9Rpw06lFJCsEEBBlVR64f+1d3nL4AHz3CAIEPixoGUAEbTw==
X-Received: by 2002:a05:6602:48c:: with SMTP id y12mr5936213iov.14.1627598432690;
        Thu, 29 Jul 2021 15:40:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id ay32sm1294002iob.16.2021.07.29.15.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 15:40:32 -0700 (PDT)
Received: (nullmailer pid 1036449 invoked by uid 1000);
        Thu, 29 Jul 2021 22:40:30 -0000
Date:   Thu, 29 Jul 2021 16:40:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Guenter Roeck <linux@roeck-us.net>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: sunxi: Add compatible for D1
Message-ID: <YQMuXrzqp5vtRaz/@robh.at.kernel.org>
References: <20210726035143.53132-1-samuel@sholland.org>
 <20210726035143.53132-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726035143.53132-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, 25 Jul 2021 22:51:42 -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
