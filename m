Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE7F2E81F3
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Dec 2020 21:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgLaUgy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 31 Dec 2020 15:36:54 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:43626 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgLaUgy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 31 Dec 2020 15:36:54 -0500
Received: by mail-ot1-f52.google.com with SMTP id q25so18804367otn.10;
        Thu, 31 Dec 2020 12:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=El9jN+B2DnGg68lutX6X8y8b1CIqQUFCD41TY/yj8qM=;
        b=jWUbINZrYRjdbfk35nNDAmRAX+ziLxsrEypOchPt5Cfy80LHNnUKGYCAgZARITIxwB
         XbswWz8YI7EpMCuNWhOiZy/B/r6d4BT5Of/2uxrdscLEPI94UleChOItLNhVt2dB88A1
         UuN2Z/8Kz23Cn5/ieDQkM9CXId13lgN7zQnWFU56v+EpNexSh1grIvJbDG8LqIp/gKTz
         afeHhsmspvO7yMIl54ZM+H2LKgI+aSPAsv9oHW23IQHkbBIDJ2JEOIZs6QN2pH7RzrnS
         Y+v9giknn5kItyGnuPXT/fdp/Nw6F93K+znkzJESXMhwTyw/M+zOJQjdcFfMLFkNGNSc
         IgrQ==
X-Gm-Message-State: AOAM531T3z4kl/HhWHSZamyALXBaNWUYi2ThigLejddsA6XAuBsFlW0C
        46Hmqwy1PHvFrH5fS6oUIQ==
X-Google-Smtp-Source: ABdhPJxb8syKkAcw58esapwheI2GQUJaWMhd4v6Prb2eaY3LkYdbu78AzmP2IQdSzyIK2hsntmxxzw==
X-Received: by 2002:a9d:3d64:: with SMTP id a91mr41900681otc.144.1609446973293;
        Thu, 31 Dec 2020 12:36:13 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id t13sm11182940oih.26.2020.12.31.12.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 12:36:12 -0800 (PST)
Received: (nullmailer pid 2318640 invoked by uid 1000);
        Thu, 31 Dec 2020 20:36:09 -0000
Date:   Thu, 31 Dec 2020 13:36:09 -0700
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/5] dt-bindings: watchdog: renesas,wdt: add r8a779a0
 (V3U) support
Message-ID: <20201231203609.GA2318586@robh.at.kernel.org>
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
 <20201218173731.12839-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218173731.12839-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 18 Dec 2020 18:37:26 +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Please apply it to the watchdog-tree.
> 
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
