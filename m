Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D35A31257E1
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Dec 2019 00:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLRXlM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Dec 2019 18:41:12 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45073 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfLRXlM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Dec 2019 18:41:12 -0500
Received: by mail-ot1-f66.google.com with SMTP id 59so4581102otp.12;
        Wed, 18 Dec 2019 15:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PqNQdT+O/1YRrinbHmkyRkVJ9xQOa2a5HYYY4UY1clA=;
        b=fiqPcggxY1n9FoyOOtiZHcuTkPbQj7kRopZFBIWQpHGFNWbAPTX9kYiEumu4uxk+lH
         7SjInjKN+4ifAf37CFHK+yMEGkReOaumHS8kIhKiblMd7Fu/61ESYUpMm1G/6GS7V1dY
         yU1/4NtZ2boWgLHOk5BXFELge6Z633FYhc2kyF1DoIH1RqaGJxop54H6MtU8rLAoOErT
         +baMx1zdC3Df16XnnmgzGev9wxfh7DcgOWe/v2XM317TIafJuFYGKLmeWE7CFnUFIDNJ
         lsLvy64jHSIMmMer3NEV1b1sblA2IotuRpGfbiT9houpWZ4g8InuzB9bjiHaEO9rsFF1
         vcUw==
X-Gm-Message-State: APjAAAVmEuiu6WBJALXhH9J2TMaxupAoEtGyqMXie/NGVL37WHhDfFF7
        0Vw3Q3jt+bup82zx979iDu8hzJZwPA==
X-Google-Smtp-Source: APXvYqxawIpRR6wk47UcEySc6FtBzz5GLBmbX307VrrvU52uxWgNd7YfH08bCuUSIuY50dnoIHp4PA==
X-Received: by 2002:a05:6830:184:: with SMTP id q4mr5527840ota.52.1576712471373;
        Wed, 18 Dec 2019 15:41:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n17sm1388954otq.46.2019.12.18.15.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 15:41:11 -0800 (PST)
Date:   Wed, 18 Dec 2019 17:41:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Document r8a77961
 support
Message-ID: <20191218234110.GA14757@bogus>
References: <20191205134751.6928-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205134751.6928-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu,  5 Dec 2019 14:47:51 +0100, Geert Uytterhoeven wrote:
> Document support for the Watchdog Timer in the Renesas R-Car M3-W+
> (R8A77961) SoC.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks.

Rob
