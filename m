Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29E989F0AF
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Aug 2019 18:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbfH0Qty (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Aug 2019 12:49:54 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35450 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfH0Qty (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Aug 2019 12:49:54 -0400
Received: by mail-oi1-f194.google.com with SMTP id a127so15504961oii.2;
        Tue, 27 Aug 2019 09:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7MPppvQzuTQRt9BznXwjvzO0Ebod4s5AerzRU45JZms=;
        b=rvC1pskTXwtYW8fj3q+q005Rgql8EfcBrkhHXuakFU+XOUPy1iirA4duu3dYGidFkr
         E8Frn2tMUZgDrOPJeJwQIdv9bXb8QyxI0ZCE8+Q5Y/yijKg71h+h6IHME3YfXH2oU0Yp
         LWTh9sADj5Nz9zoctYoOx09LObrzjehMKWzeuZeYN0cmWjfJ+PcS5G2Afzwhambm29bn
         0zqzucmv/xJkRrz+AxN8KXbYgGbE9OQGp6TJsbYRjeCc02hzvFB+skOsAvRGH7Zot2ow
         Hg5rb12iEw7ZibCtjj9Oor2ZN5Dm8PfCzSaG2Ok838cc+D9rRC51udeCox3T04TAIBlc
         im1A==
X-Gm-Message-State: APjAAAWsRoznJxqx6PCpGTYOQ0+fbrDUV/k4l8FV6odLUPfctn0udf84
        7gwjK4ghn2bnmZEJSQFx8w==
X-Google-Smtp-Source: APXvYqxdvM5S16bwNgKtmD/8gpKaMVejRbwknzUDZRxkGiPYP4MSJdQYjH2zGFN+sh6d3qXNd4ffoQ==
X-Received: by 2002:aca:ec87:: with SMTP id k129mr16354304oih.80.1566924593136;
        Tue, 27 Aug 2019 09:49:53 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f21sm5435626otq.7.2019.08.27.09.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 09:49:52 -0700 (PDT)
Date:   Tue, 27 Aug 2019 11:49:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add ast2600 compatible
Message-ID: <20190827164952.GA24417@bogus>
References: <20190819051738.17370-1-joel@jms.id.au>
 <20190819051738.17370-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819051738.17370-2-joel@jms.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 19 Aug 2019 14:47:37 +0930, Joel Stanley wrote:
> This adds a compatible for the ast2600, a new ASPEED SoC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> v2:
>  - Add Andrew's r-b
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
