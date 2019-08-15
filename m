Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21BC08F338
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732872AbfHOSXc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:23:32 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35087 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729565AbfHOSXc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:23:32 -0400
Received: by mail-pg1-f196.google.com with SMTP id n4so1659279pgv.2;
        Thu, 15 Aug 2019 11:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PJl8FXwrruUGMmqOxW12hvJtxUB7gFB5NBxP7aSECSk=;
        b=D6W+OdXOyBuyX/pxtVXzRXzbFfG+fKJXWIzIS2e51xei7HE1u5fJguFGOAsL/mU5+T
         F1nJEH89kWrXOrl6vtC9WCdjIkcfpNmQSItA8Qze19W71EYTPetEBxIxqiu2R/6cJGMq
         iBeaPEFwkgIGK0grbp2S6S94wT06o2dSZ4YPKRwfYUdj/KIGkmE0uyFu2WS/iRFjVw0k
         AYfzP8Ksvu1Gn890QQALWWAHRxK8p2MC9L/BElup4HFMH0jLdf+aschgdOLKnqw16k6o
         wuqZlfZaHPuvKnvUlF7IvJqr0AUydBYgkNpUH/d25GTYaFusMrk7Fm9x4rWwkbIi250a
         ZrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PJl8FXwrruUGMmqOxW12hvJtxUB7gFB5NBxP7aSECSk=;
        b=RWuEWWGdFd0rgoPWWKMy4OVzfbdSBbbBfIe5Orjh5usOt1yaATsAWxGFUpTSBHEePL
         RoXZz8AusPd/U5vKubEuAU0UcdU9UGT1ggCKB3Q950hQbPUQICT+l+lgCY9ziL5Hfg2X
         9vLOFhfLvO2DcsZEsHrs6TKhS2ei+NfnAUQn5xkbp9Al7QchuZMZkWn0XgKi1osf0Te7
         WIWrGBCVortOchVtj6x34DvSwYiKSgNPl0fnYFRqINigpbQbfKUS8aHw75SYSlxP3p21
         hUKNtOO0onpla8YkOkCiwhzKWaVF0h2jxjK0COlsszvE84mPCQS6oveXkJUqReUwUOVd
         Bojw==
X-Gm-Message-State: APjAAAU7rXf+9FgJf5mAzAoiz4U+5du3kMYHpoVDaYLaogykBQmz9ubz
        hcnMm2UeF59dQitNWYj7/VbFifml
X-Google-Smtp-Source: APXvYqy7L8IukBryH1pXWUtwZl1rjSvcCaKpTnBSOZl2GvQj2+6rdzksMvpZUPfjdjUXAXASHTqkWg==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr6691916pfa.95.1565893411635;
        Thu, 15 Aug 2019 11:23:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v145sm3886370pfc.31.2019.08.15.11.23.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:23:31 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:23:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/22] watchdog: ziirave_wdt: Fix DOWNLOAD_END payload
Message-ID: <20190815182330.GM14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-18-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-18-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:09:01PM -0700, Andrey Smirnov wrote:
> Bootloader firmware expects the following traffic for DOWNLOAD_END:
> 
> S Addr Wr [A] 0x11 [A] P
> 
> using ziirave_firm_write_byte() will result in
> 
> S Addr Wr [A] 0x11 [A] 0x01 [A] 0x01 [A] P
> 
> which happens to work because firmware will ignore any extra bytes
> sent. Fix this by converting the code to use i2c_smbus_write_byte()
> instead.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
