Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAA48F305
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732668AbfHOSQ3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:16:29 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43227 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732667AbfHOSQ3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:16:29 -0400
Received: by mail-pf1-f193.google.com with SMTP id v12so1705635pfn.10;
        Thu, 15 Aug 2019 11:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bSciaMuUiF5L5tmtLNvg1vCZNTJzfhGIZCtwUWNzCXw=;
        b=BThApqvHM8SEVZyOUhQ/7b4+YmP7omcfcrFA/EjTzol/9n25t6q/PuXFeGjxaeIi2s
         ozJZ7S9QEBNqBPTGfDwCrCJv9Hl8t5qYwzQWrwzeL4N/QLz7cZ62YNbGb16IPXG3Zc6n
         VwSlCQ/8rTJORv9yxLVuk7yMqR6FChxG/JWiaZ/FZ7IeyPk5K8BtXc25fwxNcy5LtacT
         TU4PsZscrQmqqUFYQ4Elbu5DxllaBTu5O8qOpA2/2rwWXmxN7S6OFAUlt5wcSUnts53v
         I8/1pz9/zo3lSJcnilEIb7SMEvwkGcSXrdojuaGnAAfz+xibdS67G9aoBMj2r9l24wwx
         o7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=bSciaMuUiF5L5tmtLNvg1vCZNTJzfhGIZCtwUWNzCXw=;
        b=IIFFyhJnQe3E5K4vmTws6PFqYb1n726scEbQa6XRAU26RXgtgcC39o/pJ60gx5Uyva
         bdQw9Yv7o3IF4E7vRs9c0FeGAUSxxS4W95+JY6MgIh/Il2UEUB/ZKNGAOFb0zLcTrQcV
         9jWNpATnfdfIwXKMwVMeKQPXWNQOj/3he+s6KivoEi4gkleikt8XRVvGRAD5qgloiQJo
         DRZdAQSge962dFnXlPuLnYG9VaIthv22TxqQLFpBseQgKSGV6eQBFEbNpNLs5zz5jWoR
         m1MSczeqp05GedD1avStZXBK2DdE1ghN4n7ZCDO3BSWsJVFCsjkiIfeWJ19mR15sctmb
         oU+w==
X-Gm-Message-State: APjAAAXB7xpAhllXvZ+MY62e4jl1ZoNF3PDBoEDknIxow71xpA1YWtgT
        OEDtWvrYECqG6jc8P7OOlgXS9RGP
X-Google-Smtp-Source: APXvYqwC4vART5YaXcLEQYxU4g+wN4EcnnKf/ZKZs/4ciUcapLTvsqnQyjeGn+AmK6NmfAfWp9eLXA==
X-Received: by 2002:aa7:91cc:: with SMTP id z12mr6777254pfa.76.1565892988609;
        Thu, 15 Aug 2019 11:16:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x22sm3997229pfo.180.2019.08.15.11.16.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:16:28 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:16:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/22] watchdog: ziirave_wdt: Skip zeros when
 calculating checksum
Message-ID: <20190815181627.GD14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-9-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-9-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:52PM -0700, Andrey Smirnov wrote:
> Zeros don't contribute anything to checksum value, so we can skip
> unused portion of the packet when calculating its checksum.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
