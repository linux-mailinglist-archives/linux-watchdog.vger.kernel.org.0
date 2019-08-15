Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2208F316
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732453AbfHOSTQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:19:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46792 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHOSTP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:19:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id m3so1041898pgv.13;
        Thu, 15 Aug 2019 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=23o7efePufPgMiRtsV680P2Y8XF1cb1fcBKJIqg5v0s=;
        b=XQzlat5ilupPPJtGBI7dl9lgCTIhhQstpG+rOreORCn27xpRRYncTjW9fw3xFsCNW7
         9jXeLOxOwauWrq3+qDR0hAh4U7YObv4cLWg0j2o9y2tehzGgKUm0kOwrlzGyPl6jCjaP
         o+LMGAM+/KLWmwE8UDJsbpjKDfqZ62ZqroEeXEjMc3oD/C3L4TSnax/8euzp4onoWrqF
         eat688HCZhiJJXYRy58Vr/+cjWy2G+t6+kfXeNxxg5ckgEgGpENtVkdxhiNu03bKexh9
         8Y8xo97J9H1G/qNtQogi4SHK99nHT0X5uM4JD/ZjND9qPqcl4aY0yU/g57VuHUD/goRl
         Kfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=23o7efePufPgMiRtsV680P2Y8XF1cb1fcBKJIqg5v0s=;
        b=rCcZ1+OyzIRkk7i5CEhu7hdXF+3IKQeq8opGp6yMR67Mv5UVjYBR/aC1DCTkh2zP0I
         eDzfVLBPBLFaRPLcirGQn4Ou0f/uqbTFBJC6hemPp20qywNPi2kcjMT7zZYnU4G0ttkX
         SlMUD/+803NBT5VfOxI8/Ohxm/ApzSI2NqKNw7jJwaLVQ0A31vlmOl8nm9SkZW8g8x06
         d9SfJ/Fi/aIS1RIcoWdZIEFOyKIUspfNqzu+KnAZc0OIns4aukgvLFGpkhVUzi7YhXmD
         hH8RfZiZhgqVq8/LzhGLiimk3UbLjZq1GLLInheq2PqCcmjRZNXcfWmLwfzqpXDZp+Mr
         EAsg==
X-Gm-Message-State: APjAAAVrB+bwukAbysTOlmL9r3B7ZNiX3KUlzL4jUXVuUQjcyJT5BKHw
        p1+qBY76fny/r94VAzcfjyE=
X-Google-Smtp-Source: APXvYqx6lJyuaGzfOV9L2AuKtJc7lV40LTY8/4JzVQZe+D9BKhGhgTr2K0t6v071c/fkjUf0kdsROg==
X-Received: by 2002:a63:c442:: with SMTP id m2mr4639543pgg.286.1565893155275;
        Thu, 15 Aug 2019 11:19:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y128sm2811186pgy.41.2019.08.15.11.19.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:19:14 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:19:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/22] watchdog: ziirave_wdt: Don't check if ihex
 record length is zero
Message-ID: <20190815181913.GH14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-13-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-13-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:56PM -0700, Andrey Smirnov wrote:
> Ihex_next_binrec() will return NULL if next record's 'len' is zero, so
> explicit checks for that in the driver are unnecessary. Drop them.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
