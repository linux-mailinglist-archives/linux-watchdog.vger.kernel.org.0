Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 868F2C43C7
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Oct 2019 00:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbfJAWV0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Oct 2019 18:21:26 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41127 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfJAWV0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Oct 2019 18:21:26 -0400
Received: by mail-io1-f68.google.com with SMTP id n26so23715742ioj.8;
        Tue, 01 Oct 2019 15:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nnP/9qrpFXzWJWcSk1bbOi362G55DzTZbktKWRu2qvk=;
        b=U+Oel9nuDwEIIgaT2jLX8hsLunZSvgn54E2uZC9si7O7iivDmPHy3dFBhqlAVY+Ty/
         5vB3KVLQq4cHvmtCI3kEvhlxevRAXui46PCu4IS7AwQLo1n+9al2fVVKVmokndkn4ZbJ
         GXBZdEQLVcdGDv2QVmfTZyWBIw0Lg12bYDomrROeokNTnSwNGiwPuviTc+1NEdO99z0d
         pYvK6KcfUiFrrNkQh9wo8aHRn/EjKqtsjjoQN63hFt6BuNLnfKcY112dWdWHk2CBSsM1
         PUHQTUTvQwGvexWnu3F9YY8x8/1fFaLWjc0zVZ67CDncjsYT6Uh5AA+7jIphvKxpjwBw
         bijw==
X-Gm-Message-State: APjAAAX6VW1mY9JUXl6dEunKhc5iErIUypWxoQF7TFIt92xoaolQqqRT
        RNomXl0+SYHFIgW4gc8CLw==
X-Google-Smtp-Source: APXvYqy/3gdgtXKKz0e+W7yj7BbuOZ3+SM3h3iZeJAMJr5dN41VJ8KQsfTODG8toKbXnQ6bcrS5PKA==
X-Received: by 2002:a02:c983:: with SMTP id b3mr710328jap.120.1569968484914;
        Tue, 01 Oct 2019 15:21:24 -0700 (PDT)
Received: from localhost ([2607:fb90:1780:6fbf:9c38:e932:436b:4079])
        by smtp.gmail.com with ESMTPSA id d14sm6455491ilm.15.2019.10.01.15.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 15:21:24 -0700 (PDT)
Date:   Tue, 1 Oct 2019 17:21:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: watchdog: meson-gxbb-wdt: Include
 generic watchdog bindings
Message-ID: <20191001222121.GA29661@bogus>
References: <20190920162124.7036-1-krzk@kernel.org>
 <20190920162124.7036-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920162124.7036-3-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 20 Sep 2019 18:21:24 +0200, Krzysztof Kozlowski wrote:
> Include generic watchdog DT schema bindings in Amlogic GXBB Watchdog
> bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
