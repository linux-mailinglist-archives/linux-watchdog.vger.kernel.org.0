Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48CA9E55E9
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2019 23:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfJYVdg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Oct 2019 17:33:36 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44317 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfJYVdg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Oct 2019 17:33:36 -0400
Received: by mail-oi1-f194.google.com with SMTP id s71so2530383oih.11;
        Fri, 25 Oct 2019 14:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:content-language
         :user-agent;
        bh=YVOI5BksXqXVDYjh4ZHfhwaKBf7oo5QOi6Ea1fnvZZA=;
        b=joRYFP9buimVYGbL4DeMgOM9yzLWMV5TFSeuGNLBXIC+KBLtdo7RcgNkb3F2T9h/Cb
         +ay4L+iWFU1fXZoXR6TmNGNcCKfGyiVz2/16USRdkFwHANMrGhHiVZWXXkkhzrglk2bB
         8Cj2u8VqDzwH6044NyMN194qgVJdPhAxVfOl0j5R9gM7b6pUOmT0KSoALlYhrqaLiiCN
         w5JOrNB1AvuqzrAp7W6qvmkBW5tvNW3yRToH5CgkA8id2Ue7ha92yP2kQ139HjsWoIpY
         uDlbWxGlZTgOSIEZqgdGST9Tr31YrE8guEFPT1IagKKDuAqxEHFiq3D749QZ3nQf6vNp
         tZUA==
X-Gm-Message-State: APjAAAXarS3it9Y35/V3vR6YS60j/eQ0PH5xnI9+8hAcOcJJLk4XywQK
        zxVBvf4SW+7ekUgxdgBGbg==
X-Google-Smtp-Source: APXvYqxYjwJxn6QbHvgIuZeN2Tf1vqbH+R6KZFoYsxBwWvCaHLGlk2Yy19NAAb3evbHiPlC//+mPmQ==
X-Received: by 2002:aca:c457:: with SMTP id u84mr4804204oif.35.1572039215372;
        Fri, 25 Oct 2019 14:33:35 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t12sm1116390otq.61.2019.10.25.14.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:33:34 -0700 (PDT)
Date:   Fri, 25 Oct 2019 16:33:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen.Hristev@microchip.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Eugen.Hristev@microchip.com
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: sama5d4_wdt: add
  microchip,sam9x60-wdt compatible
Message-ID: <20191025213334.GA23280@bogus>
References: <1571648890-15140-1-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571648890-15140-1-git-send-email-eugen.hristev@microchip.com>
Content-Language: en-US
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 21 Oct 2019 09:14:05 +0000, <Eugen.Hristev@microchip.com> wrote:
> 
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> The Atmel sama5d4_wdt needs to be compatible with microchip,sam9x60-wdt
> The sama5d4_wdt driver is updated to work with both hardware blocks
> (sama5d4/sama5d2 and sam9x60 based blocks)
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
