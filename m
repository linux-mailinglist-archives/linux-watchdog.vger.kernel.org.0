Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6318F309
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbfHOSRN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:17:13 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40419 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfHOSRN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:17:13 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so1364962pla.7;
        Thu, 15 Aug 2019 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=35JPsb1AEtl1Ar+uxX0L+1lNe1MW28q89OwSxft1IPs=;
        b=aYutJE8PFJc1ULLCKv91eUe65n4qYxEg2A75xk8NnPiaJ8V4LkaCAQMmjRzXNKop6O
         JltqUB2Mj50u93/KEHytEkg/fJliJopo23sh/0dNYeVc+5E5jjZhKwsF9uTTP2Xj5wjE
         MJFNaZpn5QAsX5dY3JDBBSoZYF+BGz9bgy+Gh79UvBCW7fRVvhXHTGPhxQSLIpM3ssST
         WCpO0B0+vQUxulttM9Z0kl7IP4eMDnUXMzoP2m38iye2ewbblhRKgc8YDQ8SBDvGJlem
         5ktvOTv9LmG44vX1tCLNbFOcguVtsIVL+VMb55ijBUBMsWNDFdUS856da9Vp9AsQosya
         rXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=35JPsb1AEtl1Ar+uxX0L+1lNe1MW28q89OwSxft1IPs=;
        b=thTLlfr0rye+7wtmfHxaVZbT1VX92xXUov3rw6mIgyHVkCffN6om/ly3i8kSSB7IBh
         SYmWlZ5Rr5qkLytoSO2ha6EdnV9EOrWYu02XH3qZQZbD4LZC5gOuN+/Jq3hWkFxceNzu
         fQ+rOmtuKj0sUoykBhUUd1JjDfXbkdXw5pJD30ab2A99IoInupY00hkRZZ//jGAYkMBr
         qo1LhzAwHFvwNn1ypfADNynZyX3nVDXv9HJxp131bY4Qb7ZbQf74Tsm/DHRzj1qu7hte
         tBZ5pUW+S0Y+2IX0nHFkhyaxcE6xOTh09jZVF6uCHdpQeW97lIo9hWjSg52+bDKCFgUW
         08zA==
X-Gm-Message-State: APjAAAWpWueOe7o+Et2CO1Mk1C6Pze5JC8mo/O5XRqE+OxVlqClb3+aN
        e3Gc4ED17AvBkLPy7MJUVsw=
X-Google-Smtp-Source: APXvYqzq4iTlyNIYEpt/UTQ8SFtMVR2pjUWkU9qLsqUBBmR/BrEe8SQULGKLYpXMh3Ndn1k0aJNKSQ==
X-Received: by 2002:a17:902:8c81:: with SMTP id t1mr2459262plo.139.1565893032775;
        Thu, 15 Aug 2019 11:17:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j10sm3306780pfn.188.2019.08.15.11.17.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:17:12 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:17:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/22] watchdog: ziirave_wdt: Fix incorrect use of
 ARRAY_SIZE
Message-ID: <20190815181710.GE14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-10-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-10-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:53PM -0700, Andrey Smirnov wrote:
> Both memset() and ziirave_firm_write_block_data() expect length in
> bytes as an argument, not a number of elements in array. It just
> happens that in this particular case both values are equal. Modify the
> code to use sizeof() instead.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
