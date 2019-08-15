Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 827978F30B
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731598AbfHOSR6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:17:58 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43753 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHOSR6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:17:58 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so1352355pld.10;
        Thu, 15 Aug 2019 11:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U1hMGYszPMJMumTu4V1iDWEJ3h8vM/Tsld8Pp3t+bY4=;
        b=W0veyTn33vRTk17bUOmzzsGNIpTcYjJavyJx+0yxADPZM4mJ5UkJ4z5B6+B5LmdFxs
         n38J6OzuKdWtuQltQWK/iRWWCN4dUdgdj+0i7N9i8hk5NJr/y222QuvkhvFgNy5T0aBe
         kI1stuXukZ57FuUFv3z6wagPkHGCZLiV3jlg36L815WTqGLPyzXZNP80xHHxiPK0I9OA
         RGlzZvgWVsJIXlrYYLZPzsssLGGyKf+okeQKGN1+RCZ1DWsH8SZDVu3xl8w1CGPQk4Ar
         JSJYHj9CNNkxl1M3fJ3353/Qt9/U21X+WAk0uhJgLIHCGbeC7ETrQCjIL5ow9ZF1b3aC
         2dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=U1hMGYszPMJMumTu4V1iDWEJ3h8vM/Tsld8Pp3t+bY4=;
        b=gFyTafrxNrXs5kCsAxJHWpA/gb3DjXMqmLZR4wIWlkQ2FcLdOyP3SbPPRJIGXQhfle
         AmO3JNgg59kysITMOWcwbgpU1fv0IPxcD5m/z+inA9XxS6ivyus+blm3fKxvFkdPGw7f
         /UBD8tCAJAwD9nVLH6reB16alSW3NIFNsQlk2FprWrA05B/YC44Acidf9Nj8y4IjbCl0
         VYPbz2QiQW3A3lDR2ravgm9J+amJiH+ptWxyRwi+9MCr5yO82nVNq/T+IZfQ3fhAJWaz
         I+ow3iWLNUvBTgSTpw9k+MVxU5M0BwO7PSSp2ScD01MJlM0zUgH2KnrwdMTIwleLP0sG
         9eRw==
X-Gm-Message-State: APjAAAWOTpxfw2tnIN8z1yinx5pFrsHZww6KUgUsAeTY2l569g2lLQsJ
        9s18+p8Z0Yl01/wad9uco38=
X-Google-Smtp-Source: APXvYqx6lQVQ2jHdNX5GWDlgjSqk5r91C2dBr/xxCdDFSbSsEYv4mXvsl7PL+Riu0U880hWhY3xqrg==
X-Received: by 2002:a17:902:2be8:: with SMTP id l95mr5154746plb.231.1565893078044;
        Thu, 15 Aug 2019 11:17:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c23sm2551391pgj.62.2019.08.15.11.17.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:17:57 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:17:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/22] watchdog: ziirave_wdt: Zero out only what's
 necessary
Message-ID: <20190815181756.GF14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-11-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-11-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:54PM -0700, Andrey Smirnov wrote:
> Instead of zeroing out all of the packet and then overwriting a
> significant portion of those zeros via memcpy(), zero out only a
> portion of the packet that is known to not contain any data.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
