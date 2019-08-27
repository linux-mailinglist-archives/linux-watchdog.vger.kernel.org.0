Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510B89F167
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Aug 2019 19:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfH0RVy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Aug 2019 13:21:54 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34355 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfH0RVy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Aug 2019 13:21:54 -0400
Received: by mail-pf1-f193.google.com with SMTP id b24so14568222pfp.1;
        Tue, 27 Aug 2019 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zRigP/msiQiDSPdu4zbzx+Q8x/ih7vzlwsY6a8Wz66s=;
        b=Iauj4YMDxlI7eSu/g9BPoFQBxpnhpWIfR4fBeRCtD1F+hz08fDxiccP5oYfoAH7en3
         bTcbEs/SFVl9UkpYreup9INiGKmMuerTPULnaBtTUygkNG0nbaoMSyflf3ERPTRpMLSP
         VVfD+4qV6SHX/L8+KcYbfan27OAC0eVHgWPrr/r0ugUUblmgOSBvN3t+cz0PmxOiN277
         /+gewSrztdybZcF91zFblvsW6WTD/D8pBvNHBm5DD8inJL4925TLHvKitxges+MpkKYc
         rwXDYio+g1DLNHBP7uCu8EKOZZXsGRXU1BcmPBdX4Q+FJZwICl99e6kCKvcIJY5YU3qd
         Rtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zRigP/msiQiDSPdu4zbzx+Q8x/ih7vzlwsY6a8Wz66s=;
        b=hkp2eQlu60tzcBkxatjrNNtwK+TrpCa2aK415tZ30MKn59tGf21BGygsVcCiFSamac
         MkW53iYqlt6XYe1Fo4r0zS1DDJEQwKUZ2K95RrDI7VsBXn3hWuFfs1DdA7S6b4xQWio+
         IhuO2uEK1faXA4FjMjFRVP1eNhJIQl69G89lQ6ZfPRKIdVLCE609t/RILrql7W2hxph7
         0+PTv04qlJhkP6DiQG+/Sk7JAPoAwJdfPyMxXBl6Zm9tL/yo/bVvLGo2MtbZ6oy0XkTP
         gVfzxREdAMLWlVkt42ffyL8kY44k3RutlG6NRsWaKoOhUKg1PZW/5JSgNq4UsuIAuNFP
         S9Ow==
X-Gm-Message-State: APjAAAUPEuIj3opf5bjlhdomoLwCBj4TdvxliK6XJ0EnIQloqj69xJ84
        xm4T7SoqaJUCffho1V3cOK7zEx66
X-Google-Smtp-Source: APXvYqyKRhppJ/qA2UBq6ZMaVWHjlMRhLmiVaZLdW9FTrJ4pwB3mo84sMTVDrIA1/lMdfAUIYt8F0A==
X-Received: by 2002:a62:4ed1:: with SMTP id c200mr27207401pfb.218.1566926513664;
        Tue, 27 Aug 2019 10:21:53 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id 6sm15692223pfa.7.2019.08.27.10.21.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 10:21:53 -0700 (PDT)
Date:   Tue, 27 Aug 2019 10:21:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Alexander Amelkin <a.amelkin@yadro.com>,
        openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] watchdog/aspeed: add support for dual boot
Message-ID: <20190827172151.GA31588@roeck-us.net>
References: <20190827165426.17037-1-i.mikhaylov@yadro.com>
 <20190827165426.17037-4-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827165426.17037-4-i.mikhaylov@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 27, 2019 at 07:54:25PM +0300, Ivan Mikhaylov wrote:
> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
> to clear out boot code source and re-enable access to the primary SPI flash
> chip while booted via wdt2 from the alternate chip.
> 
> AST2400 datasheet says:
> "In the 2nd flash booting mode, all the address mapping to CS0# would be
> re-directed to CS1#. And CS0# is not accessable under this mode. To access
> CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
> register WDT30.bit[1]."
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Please run "checkpatch --strict" on this patch and fix the reported problems
(I _did_ ask for proper multi-line aligment before, but there are a couple
of other issues as well).

Thanks,
Guenter
