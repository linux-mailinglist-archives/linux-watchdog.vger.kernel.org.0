Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD2458F330
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732834AbfHOSXB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:23:01 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43760 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729565AbfHOSXB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:23:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id v12so1714399pfn.10;
        Thu, 15 Aug 2019 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I6r9xkUCIDGW06+ejaTpiSeJRRLD5vi4+EJ3xtafcno=;
        b=t7j5WaaLgIimZFUmKcUwkdWOUn+nGVIAK23dZp6RwRENhysF47CtajMMjHyRc2CkKt
         0fQgzsv75xAd1bzfLRjsjaqqIfJfusCNvrmh3YwZFecLutgyP2thTwa/9M3UN1dupGrr
         wH8LLB3Ymciyeiy3xD47RkA81rzt3FA7bNR4xJJzyy84rgwyT4rBgYpj5uxreqD034kw
         mJ+NJNGXADaGVLMyTIiwcmsf7ikBRHNzLqT+0H7jVl+V85cr8UZM68vdJh2WROGXzsxi
         s2L/JWVqM35gfwIAvOvGgvJcjnkZJxUI3buHQexC0XttahPRS+CgmkElzuBXTs/A8LkV
         M1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=I6r9xkUCIDGW06+ejaTpiSeJRRLD5vi4+EJ3xtafcno=;
        b=s3PrQA1+pOakdfvEP5CkRltDhH6gKhabnetGpc91+WtMwqUUZ062UGaA66JuIJPBWE
         JQr4mo5MTaJ3t04EflwTHE+96VorKqF+VkmjOyyFFvttaHOGjDBQ9bfzNxoItliu3gWy
         KfLtHBrpON3uVZpKwlF4bUglue2SVDx1tD7ORd0dQ1f8xePEeal8u6S8Sq84gKJacnaV
         bw6fakezRrm9lVq3rX5RIyXQxcTcU/cvaPOIECt24kaa7TNCllngVOp7R3/LsO7BFzal
         r/pJ0yfwp0ZAXYpcgn1MVFYRfsrDKYSskXxJR/7dUe+bvd058iUVn86935pWL0fKCKsL
         uNDw==
X-Gm-Message-State: APjAAAUVz9sF0Fwf8TrwgAP6/b7aj8lzUMi09mUyd+IxamW17EGpAwM0
        McjeYCpscmXY02Fn5eZ8VZc=
X-Google-Smtp-Source: APXvYqzhC5UI9d5ry1PZ/csR99PGtScRk8UUAYK7skX/O9eHPNaZWiTRcSDxByRBqnxMgjKmSqxxrQ==
X-Received: by 2002:a63:1918:: with SMTP id z24mr4365232pgl.94.1565893380493;
        Thu, 15 Aug 2019 11:23:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d189sm3976808pfd.165.2019.08.15.11.22.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:23:00 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:22:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 16/22] watchdog: ziirave_wdt: Fix JUMP_TO_BOOTLOADER
 payload
Message-ID: <20190815182259.GL14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-17-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-17-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:09:00PM -0700, Andrey Smirnov wrote:
> Bootloader firmware expects the following traffic for
> JUMP_TO_BOOTLOADER:
> 
> S Addr Wr [A] 0x0c [A] 0x01 [A] P
> 
> using ziirave_firm_write_byte() will result in
> 
> S Addr Wr [A] 0x0c [A] 0x01 [A] 0x01 [A] P
> 
> which happens to work because firmware will ignore any extra bytes and
> expected magic value matches byte count sent by
> i2c_smbus_write_block_data(). Fix this by converting the code to use
> i2c_smbus_write_byte_data() instead.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
