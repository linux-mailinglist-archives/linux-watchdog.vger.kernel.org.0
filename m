Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E663792BB
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 May 2021 17:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbhEJPbr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 11:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236818AbhEJPbJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 11:31:09 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0892FC061351
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 08:23:44 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso14754600otm.4
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 08:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xUV80OIs9+OFLN+MwrrYBcGQz/gazjdGp/EfBUAgC40=;
        b=HGmLzHqCDFLFtSA9jMNciJvGQlSnQfwWoQOvUDgUBt4UvsfcDfrRizom6uo0YYwRBr
         J2O1NX1ZcuTXLXsihPFOo2ms6Mhz8XAECwCk/dUDDNDAH3gNUFM/8/xF1QpQuMXY2H6M
         hMG3EAzomyUk6mVyDladpSRUpzIzbB36chEYK1GK+fJafaNAKAz8l0IzoI6kgGJlgH5h
         TdLQ+gK/hMgHd7ejOA54kyyKGbGdiWv+75aEeDaTNvykElVV8yKr7x09S2xlQxeY93u1
         DaJ7EuXkU0SW5aj5PmMJH8wKln1IdxWp2L4RShOoOwmUDnV5RkidDGHCdzC30FN+SgWD
         d9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=xUV80OIs9+OFLN+MwrrYBcGQz/gazjdGp/EfBUAgC40=;
        b=s8d/hY2etzQh/YwhiIDNF9EREPAdcS9lJyeRD3gl8890JuIphcQNI7DcapyXvKVTfY
         XNThUBoHp+3PA16mdG/1ctE9X7Yy0AIzvUoF/E+K2C7hAnu7qX/T9xZOuTQxDEEMjj+i
         igvZeBI+b2wRSqXssvK/n512gXn41yP5uPLxMxcZtk670hPBX2QRHAa3tQfaZxvBaSU/
         niIppDl+lqQOHg42lnLtwTNeQ+C5MN/XdgEdg3veSB3iybLvtZ6KJ76jzmPGkgji7ML7
         +ciWH/49eOWiZN3+V1PdbAue3Szczse0CNRfdoIVVP/bgm77ivJngUObHjJME25FHgTJ
         VkLw==
X-Gm-Message-State: AOAM531K946JxkwqR505fyCr9bpfP7E8n/TtZ2pa2anhL4F0c6RsKhiA
        APUgRkpxenVsDc4vyvM6ZvA=
X-Google-Smtp-Source: ABdhPJyt7T3kQI0KKndwowwq7ctwPxzySSysDlYMi6h6NYNyCSkoW+RaY1OS5gGYoCCq8HYVZA/mmA==
X-Received: by 2002:a9d:a68:: with SMTP id 95mr21964762otg.139.1620660223474;
        Mon, 10 May 2021 08:23:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h81sm2682102oif.53.2021.05.10.08.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:23:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 10 May 2021 08:23:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Al Stone <al.stone@linaro.org>,
        Jianchao Hu <hujianchao@hisilicon.com>,
        Huiqiang Wang <wanghuiqiang@huawei.com>
Subject: Re: [PATCH] watchdog: sbsa: Support architecture version 1
Message-ID: <20210510152341.GA2704327@roeck-us.net>
References: <1620618117-20135-1-git-send-email-zhangshaokun@hisilicon.com>
 <87833e5a-978a-aac5-fc4b-1a922864066b@roeck-us.net>
 <bf9e1b65-119b-d027-fc3d-8491cbc38cde@hisilicon.com>
 <ec1bb835-3b53-4b17-1918-25975f4413a0@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec1bb835-3b53-4b17-1918-25975f4413a0@hisilicon.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, May 10, 2021 at 04:44:21PM +0800, Shaokun Zhang wrote:

> >>> +static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
> >>
> >> What is the point of making val an u64 variable ? Without changing
> > 
> > Oops, unsigned int is enough.
> > 
> 
> Sorry, it shall be 'u64', because it is the value that clock * timeout
> and will be written to WOR register which is 64-bit register in
> architecture version 1.
> 

As I have been trying to point out, that won't really happen unless
max_hw_heartbeat_ms is adjusted. The register may be a 64 bit register,
and the variable may be a 64-bit variable, but that doesn't make the
value passed in that variable larger than 32 bit unless the code is
in place to actually do that.

Guenter
